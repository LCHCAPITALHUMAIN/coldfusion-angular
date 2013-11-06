component output=false hint="Proxy for server. Could also be an angular service"
{
	remote boolean function register(id, pass, fname, lname, tweet='', blog='', photo='')
	{
		var dbServ = new server.dbservice();
		return dbServ.registerUser(id, pass, fname, lname, tweet, blog, photo);
	}

}