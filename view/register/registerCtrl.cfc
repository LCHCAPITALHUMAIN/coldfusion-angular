component client=true{
	//server registration proxy
	variables.registerService = new RegisterService();

	//constructor
	
	function init( scope, root, loc ){
		variables.scp = scope;
		variables.root = root;
		variables.loc = loc;
		variables.scp.register = self.register;
		variables.scp.takePicture = self.takePicture;
		variables.scp.registration = { password='', tweet='', email='', fname='', lname='', 
	                                 blog='',photo='' };
		variables.scp.errorMsg = "";
	}
	
	function register(){
		var user = variables.scp.registration;
		if(variables.registerService.register( user.email, user.password, user.fname, 
		                                       user.lname,user.tweet, user.blog, user.photo )){
			variables.root.user = variables.scp.registration.email;
			variables.loc.path( '/home' );
		} else{
			variables.scp.errorMsg = "user already exists";
			//        variables.scp.$apply();
		}
	}
	
	// idea is to show that any js variable can be passed. However passing document is bad!
	
	function takePicture( document ){
	
		variables.scp.registration.photo = cfclient.camera.getPicture( {}, true );
		document.getElementById( "profilepic" ).src = variables.scp.registration.photo;
	}
	
}