<cfcomponent output="false" hint="helper methods with DB calls">
	
	
	<cffunction name="getConferences" access="remote" returntype="query" >
		
		<cfquery datasource="conf" name="q1">
			
			select * from conferences
			
		</cfquery>
		<cfreturn  q1>
		
	</cffunction>
	
	<cffunction name="getUserDetail" access="remote" >
		
		
		<cfreturn "">
		
	</cffunction>
	
	<cffunction name="registerConf" access="remote" >
		
		
		<cfreturn "">
		
	</cffunction>
	
	<cffunction name="registerUser" access="remote" returntype="boolean" >
		<cfargument name="email" >
		<cfargument name="password" >
		<cfargument name="firstname" default="" >
		<cfargument name="lastname" default="" >
		<cfargument name="twitter" default="" >
		<cfargument name="blog" default="" >
		<cfargument name="image" default="" >
		
		<cftry>
        	<cfset var id = createuUID()>
			
			<cfquery datasource="conf" >
				
				insert into users values ('#id#','#email#','#firstname#', '#lastname#','#password#','#twitter#','#blog#','#image#')
				
			</cfquery>        
        <cfcatch type="Any" >
        	<cfreturn  false>
        </cfcatch>
        </cftry>
	<cfreturn true>
		
	</cffunction>
	
	<cffunction name="authenticate" access="remote" >
		<cfargument name="username" >
		<cfargument name="pwd" >
		
			<cfquery datasource="conf" name="result">
				
				select * from users where users.email = <cfqueryparam value="#username#"> and users.passowrd = <cfqueryparam value="#pwd#"> 
				
			</cfquery>
		<cfreturn (result.RecordCount gt 0 ? true:false) >
		
		
	</cffunction>

</cfcomponent>