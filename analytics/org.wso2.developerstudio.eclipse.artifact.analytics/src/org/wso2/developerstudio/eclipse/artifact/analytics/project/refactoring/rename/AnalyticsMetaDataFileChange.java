/*
*  Copyright (c) 2005-2015, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
*
*  WSO2 Inc. licenses this file to you under the Apache License,
*  Version 2.0 (the "License"); you may not use this file except
*  in compliance with the License.
*  You may obtain a copy of the License at
*
*    http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing,
* software distributed under the License is distributed on an
* "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
* KIND, either express or implied.  See the License for the
* specific language governing permissions and limitations
* under the License.
*/

package org.wso2.developerstudio.eclipse.artifact.analytics.project.refactoring.rename;

import org.eclipse.core.resources.IFile;
import org.eclipse.ltk.core.refactoring.TextFileChange;
import org.eclipse.text.edits.MultiTextEdit;
import org.eclipse.text.edits.ReplaceEdit;
import org.wso2.developerstudio.eclipse.artifact.analytics.Activator;
import org.wso2.developerstudio.eclipse.logging.core.IDeveloperStudioLog;
import org.wso2.developerstudio.eclipse.logging.core.Logger;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class AnalyticsMetaDataFileChange extends TextFileChange {
    private static IDeveloperStudioLog log = Logger.getLog(Activator.PLUGIN_ID);

    private IFile metaDataFile;
    private String newName;
    private String originalName;
    private String extension;

    public AnalyticsMetaDataFileChange(String name, IFile file, String originalName, String newName , String extension) {
        super(name, file);
        metaDataFile = file;
        this.originalName = originalName;
        this.newName = newName;
        this.extension = extension;
        addTextEdits();
    }

    private void addTextEdits() {
        if (metaDataFile.getName().equalsIgnoreCase("artifact.xml")) {
            setEdit(new MultiTextEdit());
            try {
                identifyReplaces();
            } catch (IOException e) {
                log.error("Error occured while trying to generate the refactoring", e);
            }
        }
    }

    // Here we implement the logic to identify the places to be replaced
    private void identifyReplaces() throws IOException {
        int fullIndex = 0;
        BufferedReader reader =
                new BufferedReader(new FileReader(metaDataFile.getLocation()
                        .toFile()));
        String nameWithoutExtention = originalName.substring(0,originalName.length()-extension.length()-1);
        String newNameWithoutExtention = newName.substring(0,newName.length()-extension.length()-1);
        String case1String = "\"" + nameWithoutExtention + "\"";
        String nameElement = "name=";
        String nameElementEqulasOriginalName = nameElement + case1String;
        String line = reader.readLine();
        String case2String = "/" + originalName;
        String originalFileEndsWithFileTag = case2String + "</file>";
        while (line != null) {
            String[] stringArray = line.split(" ");
            if (line.contains(nameElementEqulasOriginalName) && stringArray[getarrayIndexWithString(nameElement, stringArray)].equals(nameElementEqulasOriginalName)) {
                int case1LineIndex = line.indexOf(case1String) + 1;
                addEdit(new ReplaceEdit(fullIndex + case1LineIndex,nameWithoutExtention.length(), newNameWithoutExtention));
            } else {
                if (line.endsWith(originalFileEndsWithFileTag)) {
                    int case2LineIndex = line.indexOf(case2String) + 1;
                    addEdit(new ReplaceEdit(fullIndex + case2LineIndex, originalName.length(), newName));
                }
            }
            fullIndex += charsOnTheLine(line);
            line = reader.readLine();
        }
        reader.close();
    }

    private int charsOnTheLine(String line) {
        //Here we need to add one to represent the newline character
        line += System.getProperty("line.separator");
        return line.length();
    }

    private int getarrayIndexWithString(String stringToSearch, String[] array) {
        int index = 0;
        for (String string : array) {
            if (string.contains(stringToSearch)) {
                return index;
            }
            index++;
        }
        return -1;
    }

}
