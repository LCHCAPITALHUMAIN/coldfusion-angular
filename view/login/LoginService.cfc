component output=false hint="Proxies call to server, could be an angular service"
{
	remote function login(id, pass) output=false
	{
		writedump(var=arguments,output="console");
		var dbServ = new server.dbservice();
		var ret = dbServ.authenticate(id,pass);
		writedump(var=ret,output="console");
		return ret;
	}
	
}