<cfcomponent client="true" >
	
	<cfset DATASOURCE = "conf" >
	
	<cffunction name="syncDB" >
		
		<cfquery datasource="#DATASOURCE#" >		
			DROP TABLE IF EXISTS conference;		
		</cfquery>
		
		<cfset console.log("delted table") >
		<cfquery datasource="#DATASOURCE#" >
		
			CREATE TABLE IF NOT EXISTS conference (id, title, startdate, enddate, shortdesc,registrationurl);
		
		</cfquery>
		<cfset console.log("created table") >
		
		<cfset var dbServ = new server.dbservice()>
		<cfset var r1 = dbServ.getConferences() >
		
		<cfscript>  
        	for(var i=1;i <= r1.length;i++)
        	{
				var data=__arrayGet(r1,'data',i,false);//r1["data"][i];  
				var temp = {};
				temp.id= data[1];
				temp.title= data[2];    
				temp.startdate= data[3];
				temp.enddate= data[4];
				temp.shortdesc= data[5];
				temp.registrationurl= data[6];
        		copyDB(temp);
        	}
        	        
        </cfscript>
		
	</cffunction> 
	
	<cffunction name="clearALLDB" >
		
		<cftry>
        	<cfquery datasource="#DATASOURCE#" >		
				DROP TABLE IF EXISTS conference;		
			</cfquery>        
			<cfquery datasource="#DATASOURCE#" >		
				DROP TABLE IF EXISTS users;		
			</cfquery>
			<cfquery datasource="#DATASOURCE#" >		
				DROP TABLE IF EXISTS registration;		
			</cfquery>
        <cfcatch type="Any" >
        </cfcatch>
        </cftry>

		
	</cffunction>
	
	<cffunction name="copyDB" access="private" >
		<cfargument name="row" >
		<!---<cfset console.log(row)>--->
		<cfquery datasource="#DATASOURCE#" >
		
			insert into conference values ("#row.id#","#row.title#","#row.startdate#","#row.enddate#","#row.shortdesc#","#row.registrationurl#")
		
			</cfquery>	
		
	</cffunction>
	
	<cffunction name="initDB" >		
		<!---
		<cfquery datasource="#DATASOURCE#" >
		
			DROP TABLE conference;
		
		</cfquery>
		<cfquery datasource="#DATASOURCE#" >
		
			DROP TABLE users;
		
		</cfquery>
		<cfquery datasource="#DATASOURCE#" >
		
			DROP TABLE registration;
		
		</cfquery>
		--->
		<!---<cfset dbservice = new dbservice()>
		 get all details from db and save to local.
			For now create dummy entries ---> 
		<cfquery datasource="#DATASOURCE#" >
		
			CREATE TABLE IF NOT EXISTS conference (id, title, startdate, enddate, shortdesc,registrationurl)
		
		</cfquery>
		
		<cfloop index="i" from="1" to="5">
			
			<cfquery datasource="#DATASOURCE#" >
		
			insert into conference values ("test#i#","CFSUMMIT2013","24/10/2013","26/10/2013","Annual ColdFusion Developer Conference","")
		
		</cfquery>
			
		</cfloop>
		
		<cfquery datasource="#DATASOURCE#" >
		
			CREATE TABLE IF NOT EXISTS users (id,email,firstname,lastname,password, twitter,blog,image)	
		</cfquery>
			
		<cfquery datasource="#DATASOURCE#" >
		
			insert into users values ("1","someuser@xyz.com","test","user","pwd","twitter","","")
		
		</cfquery>
		
		<cfquery datasource="#DATASOURCE#" >
		
			CREATE TABLE IF NOT EXISTS registration (userid,confid)	
		</cfquery>
		
		
			
			<cfquery datasource="#DATASOURCE#" >
		
			insert into registration values ("1","1")
		
		</cfquery>
		
		
		<!---<cfset conntectionStatus = cfclient.connection.getType()>
		
		<cfif conntectionStatus eq WConnection.UNKNOWN >
			<cfset console.log("using local db")>
		<cfelse>
			<cfset console.log("getting latest details") >
		</cfif>--->		
		
	</cffunction>
	
	<cffunction name="getConferences" access="public" returntype="query" >
		
		<cfquery name="result" datasource="#DATASOURCE#">
			
			select * from conference
			
		</cfquery>
		
		<!---<cfset dbServ = new dbservice()>
		<cfset result = dbServ.getConferences() > --->
				
		<cfreturn result>
		
	</cffunction>
	
	<cffunction name="getConfDetails" access="public" >
		<cfargument name="id" >
		
		<cfquery name="result" datasource="#DATASOURCE#">
			
			select * from conference where id=<cfqueryparam value="#id#">
			
		</cfquery>
				
		<cfreturn result>
		
	</cffunction>
	
	<cffunction name="isUserRegistered" access="public" returntype="boolean" >
		<cfargument name="userid" >
		<cfargument name="confid" >
		
		<cfquery name="result" datasource="#DATASOURCE#">
			
			select * from registration where userid=<cfqueryparam value="#userid#"> and confid=<cfqueryparam value="#confid#">
			
		</cfquery>
			
		<cfreturn (result.ROWCOUNT eq 1)	>
	</cffunction>

</cfcomponent>