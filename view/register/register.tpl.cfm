<cfclient>

	<div class="container" >
		<div class="modal-header" >
			<h1>
				Sign up
			</h1>
		</div>
		<div class="alert alert-info" >
			Please enter your details
		</div>
		<div class="alert alert-error" ng-show="errorMsg" >
			{{errorMsg}} 
		</div>
		<div class="modal-body" >
		
			<!---styling should idealy be in css--->
			<div class="row" style="float:right;max-height:50%;max-width:50%" >
				<div class="col-sm-6 col-md-3" >
					<div class="thumbnail" >
						<img id="profilepic" src="" width="80%"
						     height="80%" >
					</div>
				</div>
			</div>
			
			<form name="myForm" id="myForm" ng-submit="register()" >
				<div class="control-group" >
					<label class="control-label" for="email" >
						Email
					</label>
					<div class="controls" >
						<input type="email" id="email" name="email"
						       placeholder="Email" ng-model="registration.email" ng-minlength="2"
						       required >
					</div>
				</div>
				<div class="control-group" >
					<label class="control-label" for="password" >
						Password
					</label>
					<div class="controls" >
						<input type="password" id="password" name="password"
						       placeholder="Password" ng-model="registration.password" ng-minlength="2"
						       password-validate required >
					</div>
				</div>
				<div class="control-group" >
					<label class="control-label" for="fname" >
						First Name
					</label>
					<div class="controls" >
						<input type="text" id="fname" name="fname"
						       placeholder="first name" ng-model="registration.fname" ng-minlength="2"
						       required >
					</div>
				</div>
				<div class="control-group" >
					<label class="control-label" for="lname" >
						Last Name
					</label>
					<div class="controls" >
						<input type="text" id="lname" name="lname"
						       placeholder="last name" ng-model="registration.lname" ng-minlength="2"
						       required >
					</div>
				</div>
				<div class="control-group" >
					<label class="control-label" for="tweet" >
						Tweet handle
					</label>
					<div class="controls" >
						<input type="text" id="tweet" name="tweet"
						       placeholder="first name" ng-model="registration.tweet" ng-minlength="2"
						       required >
					</div>
				</div>
				<div class="control-group" >
					<label class="control-label" for="blog" >
						Blog URL
					</label>
					<div class="controls" >
						<input type="url" id="blog" name="blog"
						       placeholder="blog url" ng-model="registration.blog" ng-minlength="2"
						       required >
					</div>
				</div>
				
				<input type="hidden" id="photo" name="photo"
				       ng-model="registration.photo" >
				<br>
				
				<div class="caption" >
					<button type="button" class="btn " ng-click="takePicture(document)"
					        style="float:left" >
						Picture..
					</button>
					
					<button type="submit" class="btn btn-primary" style="margin-left:100px" >
						Sign up
					</button>
				</div>
				<hr>
			</form>
		</div>
	</div>
</cfclient>