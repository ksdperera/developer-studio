/**
 * 
 */
package org.wso2.developerstudio.eclipse.artifact.analytics.utils;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Map;
import java.util.StringTokenizer;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.ErrorListener;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import net.sf.saxon.Configuration;
import net.sf.saxon.TransformerFactoryImpl;

import org.eclipse.core.resources.IFile;
import org.eclipse.core.resources.IMarker;
import org.eclipse.core.resources.IProject;
import org.eclipse.core.resources.IResource;
import org.eclipse.core.resources.IResourceDelta;
import org.eclipse.core.resources.IResourceDeltaVisitor;
import org.eclipse.core.resources.IResourceVisitor;
import org.eclipse.core.resources.IncrementalProjectBuilder;
import org.eclipse.core.runtime.CoreException;
import org.eclipse.core.runtime.FileLocator;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.Platform;
import org.osgi.framework.Bundle;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 * @author sajithd
 *
 */
public class AnalyticsBuilder extends IncrementalProjectBuilder {

	/** The factory that will create the transformers to apply the XSLs */
	private TransformerFactory transformerFactory = null;
	
	public static final String BUILDER_ID = "org.wso2.developerstudio.eclipse.artifact.analytics.analyticsBuilder";
	private static final String MARKER_TYPE = "org.wso2.developerstudio.eclipse.artifact.analytics.xmlProblem";
	private static final String BUNDLE_NAME = "org.wso2.developerstudio.eclipse.artifact.analytics";
	public static final String PATH_TO_SCH_MESSAGE = "schema/schematron-message.xsl";
	public static final String PATH_TO_SCH = "schema/receiver.sch";
	public static final String RECORD_IDENTIFIER = "@@@";
	public static final String FIELD_DELIMITER = ":";
	public static final String MESSAGE_TYPE_ASSERT = "ASSERT";
	public static final String MESSAGE_TYPE_REPORT = "REPORT";
	private SchematronValidationErrorListener errorListener = new SchematronValidationErrorListener();
	
	
	public static TransformerFactory createTransformerFactory()
	{
		Configuration config = new Configuration();
		config.setLineNumbering(true);
		// Suppress the "Running an XSLT 1.0 stylesheet with an XSLT 2.0
        // processor" messages
		config.setVersionWarning(false);

		return  new TransformerFactoryImpl(config);
	}
	
	/**
	 * 
	 */
	public AnalyticsBuilder() {
		transformerFactory = createTransformerFactory();
	}
	
	class SampleDeltaVisitor implements IResourceDeltaVisitor
	{
		/*
         * (non-Javadoc)
         * 
         * @see org.eclipse.core.resources.IResourceDeltaVisitor#visit(org.eclipse.core.resources.IResourceDelta)
         */
		@Override
		public boolean visit(IResourceDelta delta) throws CoreException
		{
			IResource resource = delta.getResource();
			switch (delta.getKind())
			{
			case IResourceDelta.ADDED:
				// handle added resource
				buildXML(resource);
				break;
			case IResourceDelta.REMOVED:
				// handle removed resource
				break;
			case IResourceDelta.CHANGED:
				// handle changed resource
				buildXML(resource);
				break;
			}
			// return true to continue visiting children.
			return true;
		}
	}
	
	/**
	 * 
	 * @param resource
	 */
	void buildXML(IResource resource)
	{
		// Don't want to check files in the compiled directory, e.g. bin
		if (resource instanceof IFile && resource.isDerived() == false)
		{
			IFile file = (IFile) resource;
			String filePerent = file.getParent().getName();
			if (file.getFileExtension().equals("xml") && filePerent.equals("receiver"))
			{
				processXML(file);
			}
		}
	}
	
	class SampleResourceVisitor implements IResourceVisitor
	{
		@Override
		public boolean visit(IResource resource)
		{
			buildXML(resource);
			// return true to continue visiting children.
			return true;
		}
	}
	
	private void addMarker(IFile file, String message, int lineNumber, int severity)
	{
		try
		{
			IMarker marker = file.createMarker(MARKER_TYPE);
			marker.setAttribute(IMarker.MESSAGE, message);
			marker.setAttribute(IMarker.SEVERITY, severity);
			if (lineNumber == -1)
			{
				lineNumber = 1;
			}
			marker.setAttribute(IMarker.LINE_NUMBER, lineNumber);
		}
		catch (CoreException e)
		{
		}
	}

	/*
     * (non-Javadoc)
     * 
     * @see org.eclipse.core.internal.events.InternalBuilder#build(int,
     *      java.util.Map, org.eclipse.core.runtime.IProgressMonitor)
     */
	@Override
	protected IProject[] build(int kind, Map<String, String> args, IProgressMonitor monitor) throws CoreException
	{
		if (kind == FULL_BUILD)
		{
			fullBuild(monitor);
		}
		else
		{
			IResourceDelta delta = getDelta(getProject());
			if (delta == null)
			{
				fullBuild(monitor);
			}
			else
			{
				incrementalBuild(delta, monitor);
			}
		}
		return null;
	}
	
	private byte[] transformToByteArray(IFile xml, Templates t) throws CoreException, TransformerException,
	FileNotFoundException
	{
		Transformer tx = t.newTransformer();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		tx.transform(new StreamSource(xml.getContents()), new StreamResult(baos));

		return baos.toByteArray();
	}
	
	private Document createDocument(IFile file) throws ParserConfigurationException, IOException, CoreException,
	SAXException
	{
		DocumentBuilderFactory fac = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = fac.newDocumentBuilder();

		return builder.parse(file.getContents());
	}
	
	/**
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 */
	private File extractSchemasFromPIs(IFile file) throws Exception
	{
		File schemaFile = null;
		Document doc = createDocument(file);
		NodeList list = doc.getChildNodes();
		for (int i = 0; i < list.getLength(); i++)
		{
			Node node = list.item(i);
			if (node.getNodeName().equals("eventReceiver"))
			{				
				Bundle bundle = Platform.getBundle(BUNDLE_NAME);
				URL fileURL = bundle.getEntry(PATH_TO_SCH);
				try {
				    schemaFile = new File(FileLocator.resolve(fileURL).toURI());
				} catch (URISyntaxException e1) {
				    e1.printStackTrace();
				} catch (IOException e1) {
				    e1.printStackTrace();
				}
				
				if (schemaFile == null || schemaFile.exists() == false)
				{
					this.addMarker(file, "Schema " + "eventReceiver" + " does not exist", 1,
									IMarker.SEVERITY_ERROR);
				}
			}
		}
		return schemaFile;
	}
	
	/**
	 * 
	 * @param file
	 */
	private void processXML(IFile file)
	{
		deleteMarkers(file);
		try
		{
			errorListener.setFile(file);
			File schematronFile = extractSchemasFromPIs(file);	
			
			File f = null;				
			Bundle bundle = Platform.getBundle(BUNDLE_NAME);
			URL fileURL = bundle.getEntry(PATH_TO_SCH_MESSAGE);
			try {
			    f = new File(FileLocator.resolve(fileURL).toURI());
			} catch (URISyntaxException e1) {
			    e1.printStackTrace();
			} catch (IOException e1) {
			    e1.printStackTrace();
			}

			// Get the schematron xsl templates
			Templates schematronTemplates = transformerFactory.newTemplates(new StreamSource(f));
			
			// Now take the schematronTemplates and apply the schema
            // to create another
			// templates object for validation			
			Transformer t = schematronTemplates.newTransformer();
			t.setParameter("allow-foreign", "true");
			
			DOMResult result = new DOMResult();	
			t.transform(new StreamSource(new FileInputStream(schematronFile)), result);

			Templates retVal = transformerFactory.newTemplates(new DOMSource(result.getNode()));
			
			byte[] output = transformToByteArray(file, retVal);

			processOutput(file, output, schematronFile);							
		}
		catch (Exception e)
		{
			this.addMarker(file, e.toString(), 1, IMarker.SEVERITY_ERROR);
		}
	}
	
	/**
	 * Process the output from the validation and report any reports or assertions
	 * 
	 * @param file the XML file that is currently being validated
	 * @param bs the message output from the validation XSL in a byte array
	 * @param schemaFile the Schematron schema file that the file is being validated against
	 * @throws IOException
	 */
	private void processOutput(IFile file, byte[] bs, File schemaFile) throws IOException
	{
		BufferedReader reader = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(bs)));
		String line = reader.readLine();

		while (line != null)
		{
			if (line.startsWith(RECORD_IDENTIFIER))
			{
				StringTokenizer st = new StringTokenizer(line.substring(RECORD_IDENTIFIER.length()), FIELD_DELIMITER);
				int lineNumber = Integer.parseInt(st.nextToken());
				String type = st.nextToken();
				//String schemaLineNo = st.nextToken();
				String message = line.substring(line.lastIndexOf(FIELD_DELIMITER) + 1);
				int level = (MESSAGE_TYPE_ASSERT.equals(type) ? IMarker.SEVERITY_ERROR : IMarker.SEVERITY_INFO);
				
				//addMarker(file, message + " (see line " + schemaLineNo + " in schema " + schemaFile.getAbsolutePath() + ")", lineNumber, level);
				addMarker(file, message , lineNumber, level);
			}
			line = reader.readLine();
		}
		reader.close();
	}
	
	class SchematronValidationErrorListener implements ErrorListener
	{
		IFile file = null;

		SchematronValidationErrorListener()
		{
			
		}
		
		public void setFile(IFile aFile)
		{
			file = aFile;
		}

		@Override
		public void error(TransformerException arg0) throws TransformerException
		{
			addMarker(file, arg0.getMessageAndLocation(), arg0.getLocator().getLineNumber(), IMarker.SEVERITY_ERROR);
		}

		@Override
		public void fatalError(TransformerException arg0) throws TransformerException
		{
			addMarker(file, arg0.getMessageAndLocation(), arg0.getLocator().getLineNumber(), IMarker.SEVERITY_ERROR);
		}

		@Override
		public void warning(TransformerException arg0) throws TransformerException
		{
			addMarker(file, arg0.getMessageAndLocation(), arg0.getLocator().getLineNumber(), IMarker.SEVERITY_WARNING);
		}

	}
	
	private void deleteMarkers(IFile file)
	{
		try
		{
			file.deleteMarkers(MARKER_TYPE, false, IResource.DEPTH_ZERO);
		}
		catch (CoreException ce)
		{
		}
	}
	
	protected void fullBuild(final IProgressMonitor monitor) throws CoreException
	{
		try
		{
			getProject().accept(new SampleResourceVisitor());
		}
		catch (CoreException e)
		{
		}
	}

	protected void incrementalBuild(IResourceDelta delta, IProgressMonitor monitor) throws CoreException
	{
		// the visitor does the work.
		delta.accept(new SampleDeltaVisitor());
	}
	
	
}
