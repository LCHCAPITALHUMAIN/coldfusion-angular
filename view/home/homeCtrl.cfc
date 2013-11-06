component client=true{
 
	function init(scope, root, loc)
	{
		variables.scp = scope; 
		variables.root = root;
		variables.loc = loc;
		variables.scp.detail = this.detail; // putting
		variables.scp.conferences=[];
		this.initData(null); // for now pass callbackstack as null
	}

	function detail(id)
	{
		variables.root.selectid = id;
		//variables.loc.path('/detail'); // add details
	} 
	
	function initData()
	{
		variables.dbObj = new clientDB();
		if(window.localStorage.getItem("syncdb") == null){
			variables.dbObj.syncDB();
			window.localStorage.setItem("syncdb", true);
		}
		var conf = variables.dbObj.getConferences();
		var intRow = 1;
		for ( ;	intRow LTE conf.ROWCOUNT ;intRow = (intRow + 1)){
			variables.scp.conferences[intRow] = structNew();
			variables.scp.conferences[intRow].id = conf[ "id" ][ intRow ];
			variables.scp.conferences[intRow].title = conf[ "title" ][ intRow ];
			variables.scp.conferences[intRow].description = conf[ "shortdesc" ][ intRow ];
		}
		variables.scp.$apply();
	} 
}