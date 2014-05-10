<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="new_ncl_file" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">

<head>

<regionBase>
	<region id="rgVideo" width="100%" height="100%"/>	
	<region width="100%" height="10%" top="85%" id="rgOutput"/>
</regionBase>

<descriptorBase>
	<descriptor id="dVideo" region="rgVideo"/>
	<descriptor id="dsOutput" region="rgOutput"/>
</descriptorBase>

<connectorBase>
	<causalConnector id="onBeginStart">
		<simpleCondition role="onBegin"/>
		<simpleAction role="start" max="unbounded"/>
	</causalConnector>
	<causalConnector id="onBeginStop">
		<simpleCondition role="onBegin"/>
		<simpleAction role="stop" max="unbounded"/>
	</causalConnector>
	<causalConnector id="onBeginSet">
		<connectorParam name="var"/>
		<simpleCondition role="onBegin"/>
		<simpleAction role="set" value="$var"/>
	</causalConnector>
	
	<causalConnector id="onEndAttributionSet">
		<connectorParam name="var"/>
		<simpleCondition role="onEndAttribution"/>
		<simpleAction role="set" value="$var"/>
	</causalConnector>	
</connectorBase>

</head>

<body>
	<port id="entryPoint" component="video1"/>
	<media id="video1" src="video.mp4" descriptor="dVideo">
	</media>

	<media id="output" src="output.lua" descriptor="dsOutput">
		<property name="text"/>
	</media>

	<link xconnector="onBeginStart">
		<bind role="onBegin" component="video1"/>
		<bind role="start"   component="output"/>
	</link>
</body>

</ncl>
