<!doctype html> 
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" >
		<script src="js/angular.min.js" >

		</script>
		<script src="js/ui/ui-bootstrap.min.js" >

		</script>
		<script src="js/angular-route.js" >

		</script>
		<link rel="stylesheet" href="css/bs/flatly.min.css" >
		<link rel="stylesheet" href="css/app.css" >
	</head>
	<cfclientsettings enabledeviceapi=true >

	<cfclient>
		<cfinclude template="view/App.cfm" >
		<body>
			<div>
				<ng-view>
				</ng-view>
			</div>
		</body>
		
	</cfclient>
	<cfclient>
		<!--- bootstrap angular after HTML is generated and pushed to DOM --->
		<cfset angular.bootstrap( document, [ 'App' ] ) >
	</cfclient>
</html>
