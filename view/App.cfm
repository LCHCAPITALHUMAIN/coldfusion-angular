<cfclient>
	<!--- including templates for different screens --->
	<cfinclude template="templates.cfm">
	<cfscript>
		// instantiate App and add settings 
		variables.app = angular.module("App", ['ui.bootstrap']);

		// set controllers 
		variables.app.controller("homeCtrl",
		function( $scope, $rootScope, $location) {
			return new home.homeCtrl( $scope, $rootScope, $location);
		});
		variables.app.controller("loginCtrl",
		function( $scope, $rootScope, $location) {
			return new login.login($scope,$rootScope,$location);
		});
		variables.app.controller("registerCtrl",
		function( $scope, $rootScope, $location) {
			return new register.register($scope,$rootScope,$location);
		});

		// router configuration
		variables.app.config(function ( $routeProvider, $locationProvider ) {

			$routeProvider.when('/login', {
				templateUrl: 'login/login.tpl.html'
				,controller: "loginCtrl"
			});

			$routeProvider.when('/home', {
				templateUrl: 'home/home.tpl.html'
				,controller: "homeCtrl"
			});
			
			$routeProvider.when('/register', {
				templateUrl: 'register/register.tpl.html'
				,controller: "registerCtrl"
			});
			
			$routeProvider.otherwise({ redirectTo: '/home' });
			$locationProvider.html5Mode(false);
		});
		
		// check for user when app starts
		variables.app.run( function ($location,$rootScope) { 
			redirectLogin($location,$rootScope);
		});

		function redirectLogin($location,$rootScope,item)
		{
			var user = $rootScope.user;
			if(!isDefined('user'))
			{
				$location.path('/login');
			}
			else
			{
				$location.path('/home');
			}
		}

	</cfscript>
</cfclient>