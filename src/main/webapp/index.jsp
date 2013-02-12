<script type="text/javascript" src="util.js"></script>
<script type="text/javascript" src="javascript/jquery-1.7.2.js"></script>
<script type="text/javascript" src="sherpa.js"></script>


<script type="text/javascript">

   <!-- call back to display JSON results
	function output(data) {
		$('#output').val(FormatJSON(data, ''));
	}

 
	$(document).ready(
			function() {

				$("#quote").click(
						function() {
							endpoint = $("#service").val();
							method = $("#method").val();
							ticker = $("#ticker").val();							
							$.sherpa.call({endpoint:endpoint, method:method, params: {ticker: ticker}}, output);		
							return false;
						});

				$("#add").click(
						function() {
							endpoint = $("#addendpoint").val();
							method = $("#addmethod").val();
							x = $("#x").val();
							y = $("#y").val();
							$.sherpa.call({endpoint:endpoint, method:method, params: {x_value:x, y_value:y}} , output);		
							return false;
						});
	
				$("#hw").click(
						function() {
							endpoint = $("#hwendpoint").val();
							method = $("#hwaction").val();
							$.sherpa.call({endpoint:endpoint, method:method } , output);		
							return false;
						});
				
				$("#dates").click(
						function() {
							endpoint = $("#datesendpoint").val();
							method = $("#datesaction").val();
							begin = $("#begin").val();
							end = $("#end").val();
							$.sherpa.call({endpoint:endpoint, method:method, params: {begin: begin, end: end} } , output);	
							return false;
						});
				
				
	
				
				$("#authenticate").click(
						function() {
							method = $("#action").val();
							userid = $("#userid").val();
							password = $("#password").val();
							$.sherpa.authenticate(userid, password, output);
							return false;
						});

				
				$("#sessions").click(
						function() {
							method = $("#sessionsaction").val();
							userid = $("#adminuserid").val();
							token = $("#token_s").val();
							password = $("#adminpassword").val();
					
							$.sherpa.call({endpoint:'Sherpa', method:method, params: {userid: userid,password:password,token:token} } , output);	
							return false;
						});
				
								
				
				
				$("#authenticated-endpoint").click(
						function() {
							endpoint = $("#endpoint-a").val();
							method = $("#action-a").val();
							userid = $("#userid-a").val();
							token = $("#token-a").val();			
							$.sherpa.call({endpoint:endpoint, method:method, params: {userid: userid,password:password,token:token} } , output);	
							return false;
						});
				
				$("#encode-endpoint").click(
						function() {
							endpoint = $("#encodeendpoint").val();
							method = $("#encodemethod").val();
							value = $("#encodevalue").val();											
							$.sherpa.call({endpoint:endpoint, method:method, params: {value: value} } , output);	
							return false;
						});				
				

			});
</script>

<H1>khsSherpa Example JSON Endpoints</H1>

<div>

   <!--  JSON Results  -->
	<div style="float: right">
		JSON Results <br />
		<textarea id="output" cols="80" rows="20"></textarea>
	</div>

   <!-- ENDPOINT Examples -->

	<div style="float: left">
		<table border="0">
		
			<!-- Stock QUOTE -->
			<tr>
				<b>Stock Quote</b>
				<br />
				<td>@Endpoint Service class <input id="service" type="input"
					readonly="true" name="endpoint" size="50" value="StockService" />
				</td>
			</tr>
			<tr>
				<td>Method <input id="method" type="input" name="action"
					readonly="true" size="50" value="quote" />
				</td>
			</tr>
			<tr>
				<td>Enter Ticker Symbol Parameter<input id="ticker" type="input"
					name="ticker" size="50" value="GOOG" />
				</td>
			</tr>
			<tr>
				<td><input id="quote" type="submit" name="submit" /></td>
			</tr>
		</table>

		<!-- Add two numbers -->

		</br> <b>Add two numbers</b> </br>

			@Endpoint Service class <input type="input" id="addendpoint" name="endpoint" size="50" value="TestService" />
				 </br>
			 Method <input type="input" id="addmethod" name="method" size="50" value="add" /> 
			    </br>
			Number 1 <input type="input" id="x" name="x" size="50" value="100.00" />
			      </br>
			Number 2 <input type="input" id="y" name="y" size="50" value="250.00" />
			     </br> 
			<input id="add" type="submit" name="submit" />

		<br />
	    <br /> <b>Hello World Service</b> </br>

		<form enctype="multipart/form-data" method="get"
			action="SherpaServlet">

			@Endpoint Service class <input type="input" id="hwendpoint" name="hwendpoint" size="50" value="TestService" /> 
				</br> Method Name
				 <input type="input" id="hwaction" name="hwaction" size="50" value="helloWorld" /> 
				 </br> <input type="submit" id="hw" name="submit" />

		</form>
		
		
		<!-- Days between dates -->

		</br> <b>Days between dates</b> </br>

			@Endpoint Service class <input type="input" id="datesendpoint" name="endpoint" size="50" value="TestService" />
				 </br>
			 Method <input type="input" id="datesaction" name="datesaction" size="50" value="diffDates" /> 
			    </br>
			Begin Date <input type="input" id="begin" name="begin" size="50" value="04/05/2012"/>
			      </br>
			End Date <input type="input" id="end" name="end" size="50" value="04/05/2012"/>
			     </br> 
			<input id="dates" type="submit" name="submit" />

		<br />

		<br /> <b>Get Authentication Token</b></br>
		<form enctype="multipart/form-data" method="get"
			action="sherpa">
			Method <input id="action" type="input" name="action" size="50"
				value="authenticate" readonly="true" /> </br> User id <input id="userid"
				type="input" name="userid" size="50"
				value="dpitt" /> </br> Password <input id="password"
				type="input" name="password" size="50" value="password" /> </br> <input
				id="authenticate" type="submit" name="submit" />
		</form>
		
		<br /> <b>User Sessions</b></br>
		<form enctype="multipart/form-data" method="get" action="sherpa">
			Method <input id="sessionsaction" type="input" name="action" size="50"
				value="sessions" readonly="true" />
				 </br> Admin User id <input id="adminuserid" type="input" name="userid" size="50" value="dpitt" />
				  </br> Admin Password <input id="adminpassword" type="input" name="password" size="50" value="password" /> 
					</br> Enter Token <input id="token-s" type="input" name="token" size="50" />
				
				  </br> <input id="sessions" type="submit" name="submit" />
		</form>
		
		<br /> <b>Deactive Userid</b></br>
		<form enctype="multipart/form-data" method="get" action="sherpa">
			Method <input id="deactivateaction" type="input" name="action" size="50"
				value="deactivateUser" readonly="true" />
				 </br> Admin User id <input id="deactivateadminuserid" type="input" name="userid" size="50" value="dpitt" />
				  </br> Admin Password <input id="deactivateadminpassword" type="input" name="password" size="50" value="password" /> 
				  </br> User id to deactivate<input id="deactivateid" type="input" name="userid" size="50"/>
				  </br> <input id="deactivate" type="submit" name="submit" />
		</form>
		
		
		<br /> <b>Invoke Authenticated Endpoint (Token Required)</b> </br>

		<form enctype="multipart/form-data" method="get"
			action="sherpa">
			User id <input id="userid-a" type="input" name="userid" size="50"
				value="dpitt" readonly="true" /> </br> Enter Token <input
				id="token-a" type="input" name="token" size="50" /> </br> @Endpoint <input
				id="endpoint-a" type="input" name="endpoint" size="50"
				value="AuthenticatedService" /> </br> Method 
				<input id="action-a" type="input" name="action" size="50" value="departments" /> </br> </br> <input
				id="authenticated-endpoint" type="submit" name="submit" />
		</form>	
		</br>

		<br /> <b>XSS Encoding Example</b> </br>

		<form enctype="multipart/form-data" method="get"
			action="sherpa">
			@Endpoint Service Class <input id="encodeendpoint" type="input" name="encodeendpoint" size="50" value="TestService" readonly="true" /> </br>
			Method <input id="encodemethod" type="input" name="method" size="50" readonly="true" value="encode"/> </br>
			Value <textarea rows="5" cols="50" id="encodevalue" name="encodevalue"><script>alert('hello world');</script></textarea> </br> 		
			<input id="encode-endpoint" type="submit" name="submit" />
		</form>	
		</br>




	</div>
</div>














