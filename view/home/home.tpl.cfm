<cfclient>
	<div class="container" >
	<div class="navbar navbar-default navbar-fixed-top" >
		<div class="navbar-header" >
			<a class="navbar-brand" href="#">Events Summary</a>
		</div>
		<div class="list-group" ng-repeat="conference in conferences" >
			<a class="list-group-item " ng-click="detail(conference.id)" >
				<h4 class="list-group-item-heading" >
					{{conference.title}} {{conference.id}}
				</h4>
				<p class="list-group-item-text" >
					{{conference.description}}
				</p>
			</a>
		</div>
	</div>
</cfclient>