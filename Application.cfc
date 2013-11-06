component 
	output = false
	hint = "I define the application settings and event handlers."
{
	 // Define the application settings.
	this.name = hash( getCurrentTemplatePath() );
	this.applicationTimeout = createTimeSpan( 0, 0, 10, 0 );
	 
	// Get the base directory so we can set up relative mappings.
	this.directory = getDirectoryFromPath( getCurrentTemplatePath() );
	 
	// Set up a mapping for "storage". Notice that the actual directory
	// name is "data."
	this.mappings[ "/server" ] = ( this.directory & "server/" );
	
	function onApplicationStart()
	{
		Application.users["a@bc.de"]=123;
	}
}