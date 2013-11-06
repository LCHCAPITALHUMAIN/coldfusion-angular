<cfclient>
	<div class="container" >
		<div class="modal-header" >
			<h1>
				Login
			</h1>
		</div>
		<div class="alert alert-info" >
			Please enter your login details
		</div>
		<div class="alert alert-error" ng-show="authError" >
			{{authError}} 
		</div>
		<div class="modal-body" ><!--- style"margin: 0 auto;"--->
			<div class="container" >
				<div class="row" >
					<div class="span2" style="float:right;padding-right: 30%;" >
						<form name="myForm" ng-submit="login()" >
							<div class="control-group" >
								<label class="control-label" for="email" >
									Email
								</label>
								<div class="controls" >
									<input type="email" id="email" name="email"
									       placeholder="Email" ng-model="session.email" ng-minlength="2"
									       required >
								</div>
							</div>
							<div class="control-group" >
								<label class="control-label" for="password" >
									Password
								</label>
								<div class="controls" >
									<input type="password" id="password" name="password"
									       placeholder="Password" ng-model="session.password" ng-minlength="2"
									       password-validate required >
								</div>
							</div>
							<div class="control-group" >
								<label class="checkbox" for="remember_me" >
									<input type="checkbox" id="remember_me" name="remember_me"
									       ng-model="session.remember_me" >
									Remember Me
								</label>
							</div>
							<div class="control-group" >
								<div class="controls" >
									<button type="submit" class="btn" >
										Login
									</button>
								</div>
							</div>
						</form>
						<br>
					</div>
					<div class="span4" style="float:left;padding-left: 10%;padding-top: 25px;" >
						<form ng-submit="registerRedirect()" class="ng-scope ng-pristine" >
						<div class="control-group" >
							<div class="controls" >
								<label class=""control-label">New User?</label>
								<button type="submit" class="btn" >
									Sign up!
								</button>
							</div>
						</div>
					</div>
						</form>
				</div>
			</div>
		</div>
		<hr>
	</div>
</cfclient>