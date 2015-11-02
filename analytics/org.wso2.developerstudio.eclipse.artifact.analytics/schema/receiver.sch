<?xml version="1.0" encoding="UTF-8"?>


<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt">

  <sch:title>Analytics Receiver Artifact Validation</sch:title>

  <sch:p>

    This schema provides  assertions and reports to validate
    receiver artifact xml doc.

  </sch:p>
  
  <sch:ns prefix="rs" uri="http://wso2.org/carbon/eventreceiver" />
  <sch:ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema" /> 
  
  <!-- Start ruling Pattern for from element eventAdapterType="email"--> 
   <sch:pattern id="FromEmail">
   		<sch:title>Checks the From contents are correct for email property</sch:title>
    
    	<sch:rule context="rs:from[@eventAdapterType='email']">
      		<sch:assert test="count(rs:property) = count(rs:property[@name='transport.PollInterval']) +
      										 count(rs:property[@name='mail.protocol.host']) +
      										 count(rs:property[@name='mail.protocol.password']) +
      										 count(rs:property[@name='mail.protocol.port']) +
      										 count(rs:property[@name='mail.protocol.user']) +
      										 count(rs:property[@name='transport.mail.Address']) +
      										 count(rs:property[@name='transport.mail.Protocol']) +
      										 count(rs:property[@name='transport.PollInterval'])">
      			Adapter type 'email' miss match with mandatory properties !
      		</sch:assert>
    	</sch:rule>
    
    	<sch:rule context="rs:property[@name='email.in.subject']">
      		<sch:assert test="//rs:from[@eventAdapterType='email']">
      			Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='email.in.subject'])=1">
         		Duplicate property name in 'email.in.subject'!
      		</sch:assert>	
    	</sch:rule>
    
    	<sch:rule context="rs:property[@name='mail.protocol.host']">
      		<sch:assert test="//rs:from[@eventAdapterType='email']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='mail.protocol.host'])=1">
         		Duplicate property name in 'mail.protocol.host'!
      		</sch:assert>
    	</sch:rule>
    
    	<sch:rule context="rs:property[@name='mail.protocol.password']">
      		<sch:assert test="//rs:from[@eventAdapterType='email']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='mail.protocol.password'])=1">
         		Duplicate property name in 'mail.protocol.password'!
      		</sch:assert>
    	</sch:rule>
    
    	<sch:rule context="rs:property[@name='mail.protocol.port']">
      		<sch:assert test="//rs:from[@eventAdapterType='email']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='mail.protocol.port'])=1">
         		Duplicate property name in 'mail.protocol.port'!
      		</sch:assert>
    	</sch:rule>
    
    	<sch:rule context="rs:property[@name='mail.protocol.user']">
      		<sch:assert test="//rs:from[@eventAdapterType='email']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='mail.protocol.user'])=1">
         		Duplicate property name in 'mail.protocol.user'!
      		</sch:assert>
    	</sch:rule>
    
    	<sch:rule context="rs:property[@name='transport.mail.Address']">
      		<sch:assert test="//rs:from[@eventAdapterType='email']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='transport.mail.Address'])=1">
         		Duplicate property name in 'transport.mail.Address'!
      		</sch:assert>
    	</sch:rule>
        
    	<sch:rule context="rs:property[@name='transport.mail.Protocol']">
     		<sch:assert test="//rs:from[@eventAdapterType='email']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='transport.mail.Protocol'])=1">
        		Duplicate property name in 'transport.mail.Protocol'!
      		</sch:assert>
    	</sch:rule>
        
    	<sch:rule context="rs:property[@name='transport.PollInterval']">
      		<sch:assert test="//rs:from[@eventAdapterType='email'] or //rs:from[@eventAdapterType='wso2event']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='transport.PollInterval'])=1">
         		Duplicate property name in 'transport.PollInterval'!
      		</sch:assert>
    	</sch:rule>   
    </sch:pattern> 
    <!-- End ruling Pattern for from element eventAdapterType="email"-->
    
    <!-- Start ruling Pattern for from element eventAdapterType="file-tail"--> 
    <sch:pattern id="FromFileTail">
   		<sch:title>Checks the From contents are correct for file-tail property</sch:title>
    
    	<sch:rule context="rs:from[@eventAdapterType='file-tail']">
      		<sch:assert test="count(rs:property) = count(rs:property[@name='filepath']) +
      										 count(rs:property[@name='delayInMillis']) +
      										 count(rs:property[@name='startFromEnd'])"
      										 >Adapter type 'file-tail' miss match with mandatory properties !</sch:assert>
    	</sch:rule>
    
    	<sch:rule context="rs:property[@name='filepath']">
      		<sch:assert test="//rs:from[@eventAdapterType='file-tail']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='filepath'])=1">
         		Duplicate property name in 'filepath'!
      		</sch:assert>
    	</sch:rule> 
    	
    	<sch:rule context="rs:property[@name='delayInMillis']">
      		<sch:assert test="//rs:from[@eventAdapterType='file-tail']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='delayInMillis'])=1">
         		Duplicate property name in 'delayInMillis'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='startFromEnd']">
      		<sch:assert test="//rs:from[@eventAdapterType='file-tail']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='startFromEnd'])=1">
         		Duplicate property name in 'startFromEnd'!
      		</sch:assert>
    	</sch:rule>
    </sch:pattern>
    <!-- End ruling Pattern for from element eventAdapterType="file-tail"-->
    
    <!-- Start ruling Pattern for from element eventAdapterType="http"--> 
    <sch:pattern id="http">
   		<sch:title>Checks the From contents are correct for http property</sch:title>
    
    	<sch:rule context="rs:from[@eventAdapterType='http']">
      		<sch:assert test="count(rs:property) = count(rs:property[@name='transports'])">
        		Adapter type 'http' miss match with mandatory properties !
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='transports']">
      		<sch:assert test="//rs:from[@eventAdapterType='http'] or //rs:from[@eventAdapterType='soap']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='transports'])=1">
         		Duplicate property name in 'transports'!
      		</sch:assert>
    	</sch:rule>
    </sch:pattern>
    <!-- End ruling Pattern for from element eventAdapterType="http"-->
    
    <!-- Start ruling Pattern for from element eventAdapterType="jms"--> 
    <sch:pattern id="jms">
   		<sch:title>Checks the From contents are correct for jms property</sch:title>
    	<sch:rule context="rs:from[@eventAdapterType='jms']">
      		<sch:assert test="count(rs:property) = count(rs:property[@name='java.naming.factory.initial']) +
      										 count(rs:property[@name='jms.properties']) +
      										 count(rs:property[@name='transport.jms.UserName']) +
      										 count(rs:property[@name='java.naming.provider.url']) +
      										 count(rs:property[@name='transport.jms.Password']) +
      										 count(rs:property[@name='transport.jms.DestinationType']) +
      										 count(rs:property[@name='transport.jms.SubscriptionDurable']) +
      										 count(rs:property[@name='transport.jms.Destination']) +
      										 count(rs:property[@name='transport.jms.DurableSubscriberName']) +
      										 count(rs:property[@name='transport.jms.ConnectionFactoryJNDIName']) ">
        		Adapter type 'jms' miss match with mandatory properties !
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='java.naming.factory.initial']">
      		<sch:assert test="//rs:from[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='java.naming.factory.initial'])=1">
         		Duplicate property name in 'java.naming.factory.initial'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='jms.properties']">
      		<sch:assert test="//rs:from[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='jms.properties'])=1">
         		Duplicate property name in 'jms.properties'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='transport.jms.UserName']">
      		<sch:assert test="//rs:from[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='transport.jms.UserName'])=1">
         		Duplicate property name in 'transport.jms.UserName'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='java.naming.provider.url']">
      		<sch:assert test="//rs:from[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='java.naming.provider.url'])=1">
         		Duplicate property name in 'java.naming.provider.url'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='transport.jms.Password']">
      		<sch:assert test="//rs:from[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='transport.jms.Password'])=1">
         		Duplicate property name in 'transport.jms.Password'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='transport.jms.DestinationType']">
      		<sch:assert test="//rs:from[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='transport.jms.DestinationType'])=1">
         		Duplicate property name in 'transport.jms.DestinationType'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='transport.jms.SubscriptionDurable']">
      		<sch:assert test="//rs:from[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='transport.jms.SubscriptionDurable'])=1">
         		Duplicate property name in 'transport.jms.SubscriptionDurable'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='transport.jms.Destination']">
      		<sch:assert test="//rs:from[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='transport.jms.Destination'])=1">
         		Duplicate property name in 'transport.jms.Destination'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='transport.jms.DurableSubscriberName']">
      		<sch:assert test="//rs:from[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='transport.jms.DurableSubscriberName'])=1">
         		Duplicate property name in 'transport.jms.DurableSubscriberName'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='transport.jms.ConnectionFactoryJNDIName']">
      		<sch:assert test="//rs:from[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='transport.jms.ConnectionFactoryJNDIName'])=1">
         		Duplicate property name in 'transport.jms.ConnectionFactoryJNDIName'!
      		</sch:assert>
    	</sch:rule>
    </sch:pattern>
    <!-- End ruling Pattern for from element eventAdapterType="jms"-->
    
    <!-- Start ruling Pattern for from element eventAdapterType="kafka"--> 
    <sch:pattern id="kafka">
    	<sch:title>Checks the From contents are correct for kafka property</sch:title>
    	
    	<sch:rule context="rs:from[@eventAdapterType='kafka']">
      		<sch:assert test="count(rs:property) = count(rs:property[@name='topic']) +
      										 count(rs:property[@name='zookeeper.connect']) +
      										 count(rs:property[@name='threads']) +
      										 count(rs:property[@name='group.id']) +
      										 count(rs:property[@name='events.duplicated.in.cluster']) +
      										 count(rs:property[@name='optional.configuration'])">
        		Adapter type 'kafka' miss match with mandatory properties !
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='topic']">
      		<sch:assert test="//rs:from[@eventAdapterType='kafka'] or //rs:from[@eventAdapterType='mqqt']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='topic'])=1">
         		Duplicate property name in 'topic'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='zookeeper.connect']">
      		<sch:assert test="//rs:from[@eventAdapterType='kafka']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='zookeeper.connect'])=1">
         		Duplicate property name in 'zookeeper.connect'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='threads']">
      		<sch:assert test="//rs:from[@eventAdapterType='kafka']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='threads'])=1">
         		Duplicate property name in 'threads'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='group.id']">
      		<sch:assert test="//rs:from[@eventAdapterType='kafka']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='group.id'])=1">
         		Duplicate property name in 'group.id'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='events.duplicated.in.cluster']">
      		<sch:assert test="//rs:from[@eventAdapterType='kafka'] or //rs:from[@eventAdapterType='wso2event'] or
      						  //rs:from[@eventAdapterType='websocket']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='events.duplicated.in.cluster'])=1">
         		Duplicate property name in 'events.duplicated.in.cluster'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='optional.configuration']">
      		<sch:assert test="//rs:from[@eventAdapterType='kafka']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='optional.configuration'])=1">
         		Duplicate property name in 'optional.configuration'!
      		</sch:assert>
    	</sch:rule>
    </sch:pattern>
    <!-- End ruling Pattern for from element eventAdapterType="kafka"-->
    
    <!-- Start ruling Pattern for from element eventAdapterType="mqqt"--> 
    <sch:pattern id="mqqt">
    	<sch:title>Checks the From contents are correct for mqqt property</sch:title>

    	<sch:rule context="rs:from[@eventAdapterType='mqqt']">
      		<sch:assert test="count(rs:property) = count(rs:property[@name='topic']) +
      										 count(rs:property[@name='url']) +
      										 count(rs:property[@name='username']) +
      										 count(rs:property[@name='password']) +
      										 count(rs:property[@name='clientId']) +
      										 count(rs:property[@name='cleanSession'])">
        		Adapter type 'mqqt' miss match with mandatory properties !
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='topic']">
      		<sch:assert test="//rs:from[@eventAdapterType='mqqt'] or //rs:from[@eventAdapterType='kafka']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='topic'])=1">
         		Duplicate property name in 'topic'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='url']">
      		<sch:assert test="//rs:from[@eventAdapterType='mqqt']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='url'])=1">
         		Duplicate property name in 'url'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='username']">
      		<sch:assert test="//rs:from[@eventAdapterType='mqqt']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='username'])=1">
         		Duplicate property name in 'username'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='password']">
      		<sch:assert test="//rs:from[@eventAdapterType='mqqt']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='password'])=1">
         		Duplicate property name in 'password'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='clientId']">
      		<sch:assert test="//rs:from[@eventAdapterType='mqqt']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='clientId'])=1">
         		Duplicate property name in 'clientId'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='cleanSession']">
      		<sch:assert test="//rs:from[@eventAdapterType='mqqt']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='cleanSession'])=1">
         		Duplicate property name in 'cleanSession'!
      		</sch:assert>
    	</sch:rule>
   	</sch:pattern>
    <!-- End ruling Pattern for from element eventAdapterType="mqqt"-->
    
    <!-- Start ruling Pattern for from element eventAdapterType="soap"--> 
    <sch:pattern id="soap">
    	<sch:title>Checks the From contents are correct for soap property</sch:title>
    	
    	<sch:rule context="rs:from[@eventAdapterType='soap']">
      		<sch:assert test="count(rs:property) = count(rs:property[@name='transports'])">
        		Adapter type 'soap' miss match with mandatory properties !
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='transports']">
      		<sch:assert test="//rs:from[@eventAdapterType='soap'] or //rs:from[@eventAdapterType='http']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='transports'])=1">
         		Duplicate property name in 'transports'!
      		</sch:assert>
    	</sch:rule>
   	</sch:pattern>
    <!-- End ruling Pattern for from element eventAdapterType="soap"-->
    	
    	
    <!-- Start ruling Pattern for from element eventAdapterType="websocket"--> 
    <sch:pattern id="websocket">
    	<sch:title>Checks the From contents are correct for soap property</sch:title>
    	
    	<sch:rule context="rs:from[@eventAdapterType='websocket']">
      		<sch:assert test="count(rs:property) = count(rs:property[@name='websocket.server.url']) +
      										 	   count(rs:property[@name='events.duplicated.in.cluster'])">
        		Adapter type 'websocket' miss match with mandatory properties !
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='websocket.server.url']">
      		<sch:assert test="//rs:from[@eventAdapterType='websocket']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='websocket.server.url'])=1">
         		Duplicate property name in 'websocket.server.url'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='events.duplicated.in.cluster']">
      		<sch:assert test="//rs:from[@eventAdapterType='websocket'] or //rs:from[@eventAdapterType='wso2event'] or 
      						  //rs:from[@eventAdapterType='kafka']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='events.duplicated.in.cluster'])=1">
         		Duplicate property name in 'events.duplicated.in.cluster'!
      		</sch:assert>
    	</sch:rule>
    </sch:pattern>
    <!-- End ruling Pattern for from element eventAdapterType="websocket"-->    
    
    
    <!-- Start ruling Pattern for from element eventAdapterType="websocket-local"--> 
    <sch:pattern id="websocket-local">
    	<sch:title>Checks the From contents are correct for websocket-local property</sch:title>
    	
    	<sch:rule context="rs:from[@eventAdapterType='websocket-local']">
      		<sch:assert test="count(rs:property) = 0">
        		Adapter type 'websocket-local' miss match with mandatory properties !
      		</sch:assert>
    	</sch:rule>
    </sch:pattern>
    <!-- End ruling Pattern for from element eventAdapterType="websocket-local"-->
    
    
    <!-- Start ruling Pattern for from element eventAdapterType="wso2event"--> 
    <sch:pattern id="wso2event">
    	<sch:title>Checks the From contents are correct for wso2event property</sch:title>  
    	
    	<sch:rule context="rs:from[@eventAdapterType='wso2event']">
      		<sch:assert test="count(rs:property) = count(rs:property[@name='events.duplicated.in.cluster'])+
      											   count(rs:property[@name='transport.PollInterval'])">
        		Adapter type 'wso2event' miss match with mandatory properties !
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='events.duplicated.in.cluster']">
      		<sch:assert test="//rs:from[@eventAdapterType='wso2event'] or //rs:from[@eventAdapterType='websocket']or
      						  //rs:from[@eventAdapterType='kafka']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='events.duplicated.in.cluster'])=1">
         		Duplicate property name in 'events.duplicated.in.cluster'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="rs:property[@name='transport.PollInterval']">
      		<sch:assert test="//rs:from[@eventAdapterType='wso2event'] or //rs:from[@eventAdapterType='email']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//rs:from/rs:property[@name='transport.PollInterval'])=1">
         		Duplicate property name in 'transport.PollInterval'!
      		</sch:assert>
    	</sch:rule>
  	</sch:pattern>
  	<!-- End ruling Pattern for from element eventAdapterType="websocket"-->
  	
  	<!-- Start ruling Pattern for mapping element customMapping="disable"--> 
   	<sch:pattern id="MappingDisable">
   		<sch:title>Checks the Mapping contents are correct for mapping disable property</sch:title>
   		<sch:rule context="rs:mapping[@customMapping='disable']">
      		<sch:assert test="count(current()/child::node())=0">
         		Mapping should be enable in order to add child elements!
      		</sch:assert>
    	</sch:rule>
   	</sch:pattern>
  	<!-- End ruling Pattern for mapping element customMapping="disable"-->
  	
  	<!-- Start ruling Pattern for mapping element customMapping="enable"--> 
   	<sch:pattern id="MappingEnable">
   		<sch:title>Checks the Mapping contents are correct for mapping enable property</sch:title>
   		<sch:rule context="rs:mapping[@customMapping='enable']">
      		<sch:assert test="current()/rs:property">
         		Required child element missing 'property' !
      		</sch:assert>	
    	</sch:rule>
   	</sch:pattern>
  	<!-- End ruling Pattern for mapping element customMapping="enable"-->
  	
  	<!-- Start ruling Pattern for mapping element type=" "--> 
   	<sch:pattern id="MappingType">
   		<sch:title>Checks the Mapping contents are correct for mapping type</sch:title>

		<sch:rule context="rs:mapping[@type='xml']">
      		<sch:assert test="current()/rs:xpathDefinition">
         		Required child element missing 'xpathDefinition' !
      		</sch:assert>	
    	</sch:rule>
    	
    	<sch:rule context="rs:mapping/rs:from">
      		<sch:assert test="..[@type='wso2event']">
         		Invalid child element name 'from' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
    	<sch:rule context="rs:mapping/rs:xpathDefinition">
      		<sch:assert test="..[@type='xml']">
         		Invalid child element name 'xpathDefinition' under this mapping type!
      		</sch:assert>	
    	</sch:rule>	
   	</sch:pattern>
  	<!-- End ruling Pattern for mapping element type=" "-->
  	
  	<!-- Start ruling Pattern for mapping property from attribute--> 
   	<sch:pattern id="MappingPropertyFrom">
   		<sch:title>Checks the Mapping Property From element attribute correct for mapping type</sch:title>
    	
    	<sch:rule context="rs:mapping[@type='wso2event']/rs:property/rs:from">
      		<sch:assert test="count(current()[@dataType]) + count(current()[@name])=count(attribute::*)">
         		Invalid attribute name under this mapping name!
      		</sch:assert>	
    	</sch:rule>

		<sch:rule context="rs:mapping[@type='xml']">
      		<sch:assert test="current()/rs:xpathDefinition">
         		Required child element missing 'xpathDefinition' !
      		</sch:assert>	
    	</sch:rule>
    	
    	<sch:rule context="rs:mapping/rs:from">
      		<sch:assert test="..[@type='wso2event']">
         		Invalid child element name 'from' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
    	<sch:rule context="rs:mapping/rs:xpathDefinition">
      		<sch:assert test="..[@type='xml']">
         		Invalid child element name 'xpathDefinition' under this mapping type!
      		</sch:assert>	
    	</sch:rule>	
   	</sch:pattern>
  	<!-- End ruling Pattern for mapping element type=" "-->	
   		
</sch:schema>