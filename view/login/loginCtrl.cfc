component client=true{
	variables.loginService = new LoginService();

	function init( scope, root, loc ){
		variables.scp = scope;
		variables.root = root;
		variables.loc = loc;
		variables.scp.registerRedirect = self.registerRedirect;
		variables.scp.login = self.login;
		variables.scp.session = { email='', remember_me=false, password="" };
		variables.scp.authError = null;
	}
	
	function registerRedirect(){
		variables.loc.path( '/register' );
	}
	
	function login(){
		console.log( variables.scp.session.password );
		if(variables.loginService.login( variables.scp.session.email, 
		                                 variables.scp.session.password )){
			variables.root.user = variables.scp.session.email;
			variables.loc.path( '/home' );
		} else{
			variables.scp.authError = "Wrong username or password.";
		}
	}
	
}