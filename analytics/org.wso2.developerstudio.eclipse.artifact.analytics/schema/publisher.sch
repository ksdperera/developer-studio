<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt">

  <sch:title>Analytics Publisher Artifact Validation</sch:title>

  <sch:p>

    This schema provides  assertions and reports to validate
    publisher artifact xml doc.

  </sch:p>
  
  <sch:ns prefix="pb" uri="http://wso2.org/carbon/eventpublisher" />
  <sch:ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema" /> 

  	<!-- Start ruling Pattern for mapping element customMapping="disable"--> 
   	<sch:pattern id="MappingDisable">
   		<sch:title>Checks the Mapping contents are correct for mapping disable property</sch:title>
   		<sch:rule context="pb:mapping[@customMapping='disable']">
      		<sch:assert test="count(current()/child::node())=0">
         		Mapping should be enable in order to add child elements!
      		</sch:assert>
    	</sch:rule>
   	</sch:pattern>
  	<!-- End ruling Pattern for mapping element customMapping="disable"-->
  	
  	<!-- Start ruling Pattern for mapping element customMapping="enable"--> 
   	<sch:pattern id="MappingEnable">
   		<sch:title>Checks the Mapping contents are correct for mapping enable property</sch:title>
   		<sch:rule context="pb:mapping[@customMapping='enable']">
      		<sch:assert test="count(current()/child::node())>0">
         		Required child elements missing !
      		</sch:assert>	
    	</sch:rule>
   	</sch:pattern>
  	<!-- End ruling Pattern for mapping element customMapping="enable"-->
  	
  	<!-- Start ruling Pattern for mapping element customMapping="enable" and wso2event--> 
   	<sch:pattern id="MappingEnableWso2event">
   		<sch:title>Checks the Mapping contents are correct for mapping enable property and wso2event</sch:title>
   		
   		<sch:rule context="pb:mapping/pb:to">
      		<sch:assert test="..[@customMapping='enable'] and ..[@type='wso2event']">
         		Invalid element 'to' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
    	<sch:rule context="pb:mapping/pb:metaData">
      		<sch:assert test="..[@customMapping='enable'] and ..[@type='wso2event']">
         		Invalid element 'metaData' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
    	<sch:rule context="pb:mapping/pb:metaData/pb:property">
      		<sch:assert test="../..[@customMapping='enable'] and ../..[@type='wso2event']">
         		Invalid element 'property' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
    	<sch:rule context="pb:mapping/pb:payloadData">
      		<sch:assert test="..[@customMapping='enable'] and ..[@type='wso2event']">
         		Invalid element 'payloadData' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
    	<sch:rule context="pb:mapping/pb:payloadData/pb:property">
      		<sch:assert test="../..[@customMapping='enable'] and ../..[@type='wso2event']">
         		Invalid element 'property' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
    	<sch:rule context="pb:mapping/pb:metaData/pb:property/pb:from">
      		<sch:assert test="../../..[@customMapping='enable'] and ../../..[@type='wso2event']">
         		Invalid element 'from' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
    	<sch:rule context="pb:mapping/pb:metaData/pb:property/pb:to">
      		<sch:assert test="../../..[@customMapping='enable'] and ../../..[@type='wso2event']">
         		Invalid element 'to' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
    	<sch:rule context="pb:mapping/pb:payloadData/pb:property/pb:from">
      		<sch:assert test="../../..[@customMapping='enable'] and ../../..[@type='wso2event']">
         		Invalid element 'from' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
    	<sch:rule context="pb:mapping/pb:payloadData/pb:property/pb:to">
      		<sch:assert test="../../..[@customMapping='enable'] and ../../..[@type='wso2event']">
         		Invalid element 'to' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
   	</sch:pattern>
  	<!-- End ruling Pattern for mapping element customMapping="enable"  and wso2event--> 
  	
  	<!-- Start ruling Pattern for mapping element customMapping="enable" and xml, json, text--> 
   	<sch:pattern id="MappingEnableXML_JSON_TEXT">
   		<sch:title>Checks the Mapping contents are correct for mapping enable property and xml, json and text</sch:title>
   		
   		<sch:rule context="pb:mapping/pb:inline">
      		<sch:assert test="..[@customMapping='enable'] and (..[@type='xml'] or ..[@type='json'] or ..[@type='text'] )">
         		Invalid element 'inline' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
   	</sch:pattern>
  	<!-- End ruling Pattern for mapping element customMapping="enable"  and xml, json, text--> 
  	
  	<!-- Start ruling Pattern for mapping element customMapping="enable" and map--> 
   	<sch:pattern id="MappingEnableMap">
   		<sch:title>Checks the Mapping contents are correct for mapping enable property and map</sch:title>
   		
   		<sch:rule context="pb:mapping/pb:property">
      		<sch:assert test="..[@customMapping='enable'] and ..[@type='map']">
         		Invalid element 'property' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
    	<sch:rule context="pb:mapping/pb:property/pb:from">
      		<sch:assert test="../..[@customMapping='enable'] and ../..[@type='map']">
         		Invalid element 'from' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
    	<sch:rule context="pb:mapping/pb:property/pb:to">
      		<sch:assert test="../..[@customMapping='enable'] and ../..[@type='map']">
         		Invalid element 'to' under this mapping type!
      		</sch:assert>	
    	</sch:rule>
    	
   	</sch:pattern>
  	<!-- End ruling Pattern for mapping element customMapping="enable"  and map-->
  	
  	<!-- Start ruling Pattern for eventAdapterType 'cassandra'--> 
   	<sch:pattern id="CassandraAdapter">
   		<sch:title>Checks the Adapter contents are correct for adapter type cassandra</sch:title>
    	
    	<sch:rule context="pb:to/pb:property[@name='port']">
      		<sch:assert test="//pb:to[@eventAdapterType='cassandra']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='port'])=1">
         		Duplicate property name in 'port'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='indexed.columns']">
      		<sch:assert test="//pb:to[@eventAdapterType='cassandra']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='indexed.columns'])=1">
         		Duplicate property name in 'indexed.columns'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='key.space.name']">
      		<sch:assert test="//pb:to[@eventAdapterType='cassandra']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='key.space.name'])=1">
         		Duplicate property name in 'key.space.name'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='user.name']">
      		<sch:assert test="//pb:to[@eventAdapterType='cassandra']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='user.name'])=1">
         		Duplicate property name in 'user.name'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='column.family.name']">
      		<sch:assert test="//pb:to[@eventAdapterType='cassandra']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='column.family.name'])=1">
         		Duplicate property name in 'column.family.name'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='hosts']">
      		<sch:assert test="//pb:to[@eventAdapterType='cassandra']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='hosts'])=1">
         		Duplicate property name in 'hosts'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='replication.factor']">
      		<sch:assert test="//pb:to[@eventAdapterType='cassandra']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='replication.factor'])=1">
         		Duplicate property name in 'replication.factor'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='strategy.class']">
      		<sch:assert test="//pb:to[@eventAdapterType='cassandra']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='strategy.class'])=1">
         		Duplicate property name in 'strategy.class'!
      		</sch:assert>
    	</sch:rule>
    	
   	</sch:pattern>
  	<!-- End ruling Pattern for eventAdapterType 'cassandra'--> 
  	
  	<!-- Start ruling Pattern for eventAdapterType 'email'--> 
   	<sch:pattern id="EmailAdapter">
   		<sch:title>Checks the Adapter contents are correct for adapter type email</sch:title>
    	
    	<sch:rule context="pb:to/pb:property[@name='email.address']">
      		<sch:assert test="//pb:to[@eventAdapterType='email']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='email.address'])=1">
         		Duplicate property name in 'email.address'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='email.type']">
      		<sch:assert test="//pb:to[@eventAdapterType='email']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='email.type'])=1">
         		Duplicate property name in 'email.type'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='email.subject']">
      		<sch:assert test="//pb:to[@eventAdapterType='email']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='email.subject'])=1">
         		Duplicate property name in 'email.subject'!
      		</sch:assert>
    	</sch:rule>
   	</sch:pattern>
  	<!-- End ruling Pattern for eventAdapterType 'email'-->  
  	
  	<!-- Start ruling Pattern for eventAdapterType 'http'--> 
   	<sch:pattern id="HttpAdapter">
   		<sch:title>Checks the Adapter contents are correct for adapter type http</sch:title>
    	
    	<sch:rule context="pb:to/pb:property[@name='http.client.method']">
      		<sch:assert test="//pb:to[@eventAdapterType='http']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='http.client.method'])=1">
         		Duplicate property name in 'http.client.method'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='http.username']">
      		<sch:assert test="//pb:to[@eventAdapterType='http']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='http.username'])=1">
         		Duplicate property name in 'http.username'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='http.proxy.host']">
      		<sch:assert test="//pb:to[@eventAdapterType='http']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='http.proxy.host'])=1">
         		Duplicate property name in 'http.proxy.host'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='http.proxy.port']">
      		<sch:assert test="//pb:to[@eventAdapterType='http']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='http.proxy.port'])=1">
         		Duplicate property name in 'http.proxy.port'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='http.password']">
      		<sch:assert test="//pb:to[@eventAdapterType='http']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='http.password'])=1">
         		Duplicate property name in 'http.password'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='http.headers']">
      		<sch:assert test="//pb:to[@eventAdapterType='http']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='http.headers'])=1">
         		Duplicate property name in 'http.headers'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='http.url']">
      		<sch:assert test="//pb:to[@eventAdapterType='http']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='http.url'])=1">
         		Duplicate property name in 'http.url'!
      		</sch:assert>
    	</sch:rule>
   	</sch:pattern>
  	<!-- End ruling Pattern for eventAdapterType 'http'--> 	
  	
  	<!-- Start ruling Pattern for eventAdapterType 'jms'--> 
   	<sch:pattern id="JmsAdapter">
   		<sch:title>Checks the Adapter contents are correct for adapter type jms</sch:title>
    	
    	<sch:rule context="pb:to/pb:property[@name='java.naming.factory.initial']">
      		<sch:assert test="//pb:to[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='java.naming.factory.initial'])=1">
         		Duplicate property name in 'java.naming.factory.initial'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='java.naming.provider.url']">
      		<sch:assert test="//pb:to[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='java.naming.provider.url'])=1">
         		Duplicate property name in 'java.naming.provider.url'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='transport.jms.UserName']">
      		<sch:assert test="//pb:to[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='transport.jms.UserName'])=1">
         		Duplicate property name in 'transport.jms.UserName'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='transport.jms.Password']">
      		<sch:assert test="//pb:to[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='transport.jms.Password'])=1">
         		Duplicate property name in 'transport.jms.Password'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='transport.jms.DestinationType']">
      		<sch:assert test="//pb:to[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='transport.jms.DestinationType'])=1">
         		Duplicate property name in 'transport.jms.DestinationType'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='transport.jms.Header']">
      		<sch:assert test="//pb:to[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='transport.jms.Header'])=1">
         		Duplicate property name in 'transport.jms.Header'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='transport.jms.Destination']">
      		<sch:assert test="//pb:to[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='transport.jms.Destination'])=1">
         		Duplicate property name in 'transport.jms.Destination'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='transport.jms.ConnectionFactoryJNDIName']">
      		<sch:assert test="//pb:to[@eventAdapterType='jms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='transport.jms.ConnectionFactoryJNDIName'])=1">
         		Duplicate property name in 'transport.jms.ConnectionFactoryJNDIName'!
      		</sch:assert>
    	</sch:rule>
    	
	</sch:pattern>
  	<!-- End ruling Pattern for eventAdapterType 'jms'-->
  	
  	<!-- Start ruling Pattern for eventAdapterType 'kafka'--> 
   	<sch:pattern id="KafkaAdapter">
   		<sch:title>Checks the Adapter contents are correct for adapter type kafka</sch:title>
    		
    	<sch:rule context="pb:to/pb:property[@name='optional.configuration']">
      		<sch:assert test="//pb:to[@eventAdapterType='kafka']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='optional.configuration'])=1">
         		Duplicate property name in 'optional.configuration'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='meta.broker.list']">
      		<sch:assert test="//pb:to[@eventAdapterType='kafka']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='meta.broker.list'])=1">
         		Duplicate property name in 'meta.broker.list'!
      		</sch:assert>
    	</sch:rule>
	</sch:pattern>
  	<!-- End ruling Pattern for eventAdapterType 'kafka'-->
  	
  	<!-- Start ruling Pattern for eventAdapterType 'Logger'--> 
   	<sch:pattern id="LoggerAdapter">
   		<sch:title>Checks the Adapter contents are correct for adapter type logger</sch:title>
    	
    	<sch:rule context="pb:to/pb:property[@name='uniqueId']">
      		<sch:assert test="//pb:to[@eventAdapterType='logger']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='uniqueId'])=1">
         		Duplicate property name in 'uniqueId'!
      		</sch:assert>
    	</sch:rule>
	</sch:pattern>
  	<!-- End ruling Pattern for eventAdapterType 'Logger'-->
  	
  	<!-- Start ruling Pattern for eventAdapterType 'mqtt'--> 
   	<sch:pattern id="MqttAdapter">
   		<sch:title>Checks the Adapter contents are correct for adapter type mqtt</sch:title>
    	
    	<sch:rule context="pb:to/pb:property[@name='qos']">
      		<sch:assert test="//pb:to[@eventAdapterType='mqtt']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='qos'])=1">
         		Duplicate property name in 'qos'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='clientId']">
      		<sch:assert test="//pb:to[@eventAdapterType='mqtt']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='clientId'])=1">
         		Duplicate property name in 'clientId'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='cleanSession']">
      		<sch:assert test="//pb:to[@eventAdapterType='mqtt']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='cleanSession'])=1">
         		Duplicate property name in 'cleanSession'!
      		</sch:assert>
    	</sch:rule>
	</sch:pattern>
  	<!-- End ruling Pattern for eventAdapterType 'mqtt'-->
  	
  	<!-- Start ruling Pattern for eventAdapterType 'rdbms'--> 
   	<sch:pattern id="RdbmsAdapter">
   		<sch:title>Checks the Adapter contents are correct for adapter type rdbms</sch:title>
    	
    	<sch:rule context="pb:to/pb:property[@name='datasource.name']">
      		<sch:assert test="//pb:to[@eventAdapterType='rdbms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='datasource.name'])=1">
         		Duplicate property name in 'datasource.name'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='table.name']">
      		<sch:assert test="//pb:to[@eventAdapterType='rdbms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='table.name'])=1">
         		Duplicate property name in 'table.name'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='execution.mode']">
      		<sch:assert test="//pb:to[@eventAdapterType='rdbms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='execution.mode'])=1">
         		Duplicate property name in 'execution.mode'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='update.keys']">
      		<sch:assert test="//pb:to[@eventAdapterType='rdbms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='update.keys'])=1">
         		Duplicate property name in 'update.keys'!
      		</sch:assert>
    	</sch:rule>
	</sch:pattern>
  	<!-- End ruling Pattern for eventAdapterType 'rdbms'-->
  	
  	<!-- Start ruling Pattern for eventAdapterType 'sms'--> 
   	<sch:pattern id="SmsAdapter">
   		<sch:title>Checks the Adapter contents are correct for adapter type sms</sch:title>
    	
    	<sch:rule context="pb:to/pb:property[@name='sms.no']">
      		<sch:assert test="//pb:to[@eventAdapterType='sms']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='sms.no'])=1">
         		Duplicate property name in 'sms.no'!
      		</sch:assert>
    	</sch:rule>
	</sch:pattern>
  	<!-- End ruling Pattern for eventAdapterType 'sms'-->
  	
  	<!-- Start ruling Pattern for eventAdapterType 'soap'--> 
   	<sch:pattern id="SoapAdapter">
   		<sch:title>Checks the Adapter contents are correct for adapter type soap</sch:title>
    	
    	<sch:rule context="pb:to/pb:property[@name='httpHeaders']">
      		<sch:assert test="//pb:to[@eventAdapterType='soap']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='httpHeaders'])=1">
         		Duplicate property name in 'httpHeaders'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='soapHeaders']">
      		<sch:assert test="//pb:to[@eventAdapterType='soap']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='soapHeaders'])=1">
         		Duplicate property name in 'soapHeaders'!
      		</sch:assert>
    	</sch:rule>
	</sch:pattern>
  	<!-- End ruling Pattern for eventAdapterType 'soap'-->
  	
  	<!-- Start ruling Pattern for eventAdapterType 'ui'--> 
   	<sch:pattern id="UiAdapter">
   		<sch:title>Checks the Adapter contents are correct for adapter type ui</sch:title>
    	
    	<sch:rule context="pb:to/pb:property[@name='output.event.stream.version']">
      		<sch:assert test="//pb:to[@eventAdapterType='ui']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='output.event.stream.version'])=1">
         		Duplicate property name in 'output.event.stream.version'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='output.event.stream.name']">
      		<sch:assert test="//pb:to[@eventAdapterType='ui']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='output.event.stream.name'])=1">
         		Duplicate property name in 'output.event.stream.name'!
      		</sch:assert>
    	</sch:rule>
	</sch:pattern>
  	<!-- End ruling Pattern for eventAdapterType 'ui'-->
  	
  	<!-- Start ruling Pattern for eventAdapterType 'websocket'--> 
   	<sch:pattern id="WebsocketAdapter">
   		<sch:title>Checks the Adapter contents are correct for adapter type websocket</sch:title>
    	
    	<sch:rule context="pb:to/pb:property[@name='websocket.server.url']">
      		<sch:assert test="//pb:to[@eventAdapterType='websocket']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='websocket.server.url'])=1">
         		Duplicate property name in 'websocket.server.url'!
      		</sch:assert>
    	</sch:rule>
	</sch:pattern>
  	<!-- End ruling Pattern for eventAdapterType 'websocket'-->
  	
  	<!-- Start ruling Pattern for eventAdapterType 'wso2event'--> 
   	<sch:pattern id="Wso2eventAdapter">
   		<sch:title>Checks the Adapter contents are correct for adapter type wso2event</sch:title>
    	
    	<sch:rule context="pb:to/pb:property[@name='protocol']">
      		<sch:assert test="//pb:to[@eventAdapterType='wso2event']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='protocol'])=1">
         		Duplicate property name in 'protocol'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='publishingMode']">
      		<sch:assert test="//pb:to[@eventAdapterType='wso2event']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='publishingMode'])=1">
         		Duplicate property name in 'publishingMode'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='publishTimeout']">
      		<sch:assert test="//pb:to[@eventAdapterType='wso2event']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='publishTimeout'])=1">
         		Duplicate property name in 'publishTimeout'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='receiverURL']">
      		<sch:assert test="//pb:to[@eventAdapterType='wso2event']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='receiverURL'])=1">
         		Duplicate property name in 'receiverURL'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='authenticatorURL']">
      		<sch:assert test="//pb:to[@eventAdapterType='wso2event']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='authenticatorURL'])=1">
         		Duplicate property name in 'authenticatorURL'!
      		</sch:assert>
    	</sch:rule>
	</sch:pattern>
  	<!-- End ruling Pattern for eventAdapterType 'wso2event'-->
  	
  	<!-- Start ruling Pattern for common property types in eventAdapterTypes cassandra, kafka, mqtt, soap, wso2event--> 
   	<sch:pattern id="CommonProperty">
   		<sch:title>Checks the Adapter contents are correct for common property types</sch:title>
    	
    	<sch:rule context="pb:to/pb:property[@name='topic']">
      		<sch:assert test="//pb:to[@eventAdapterType='kafka'] or //pb:to[@eventAdapterType='mqtt']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='topic'])=1">
         		Duplicate property name in 'topic'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='password']">
      		<sch:assert test="//pb:to[@eventAdapterType='cassandra'] or //pb:to[@eventAdapterType='mqtt'] or //pb:to[@eventAdapterType='soap'] or //pb:to[@eventAdapterType='wso2event']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='password'])=1">
         		Duplicate property name in 'password'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='url']">
      		<sch:assert test="//pb:to[@eventAdapterType='mqtt'] or //pb:to[@eventAdapterType='soap']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='url'])=1">
         		Duplicate property name in 'url'!
      		</sch:assert>
    	</sch:rule>
    	
    	<sch:rule context="pb:to/pb:property[@name='username']">
      		<sch:assert test="//pb:to[@eventAdapterType='mqtt'] or //pb:to[@eventAdapterType='soap'] or //pb:to[@eventAdapterType='wso2event']">
         		Property name invalid under the adapter type!
      		</sch:assert>
      		<sch:assert test="count(//pb:to/pb:property[@name='username'])=1">
         		Duplicate property name in 'username'!
      		</sch:assert>
    	</sch:rule>
    	
	</sch:pattern>
  	<!-- End ruling Pattern for common property types in eventAdapterTypes cassandra, kafka, mqtt, soap, wso2event-->
  	
   		
</sch:schema>