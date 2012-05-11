<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
	function RealTypeOf(v) {
		if (typeof (v) == "object") {
			if (v === null)
				return "null";
			if (v.constructor == (new Array).constructor)
				return "array";
			if (v.constructor == (new Date).constructor)
				return "date";
			if (v.constructor == (new RegExp).constructor)
				return "regex";
			return "object";
		}
		return typeof (v);
	}

	function FormatJSON(oData, sIndent) {
		if (arguments.length < 2) {
			var sIndent = "";
		}
		var sIndentStyle = "    ";
		var sDataType = RealTypeOf(oData);
		if (sDataType == "array") {
			if (oData.length == 0) {
				return "[]";
			}
			var sHTML = "[";
		} else {
			var iCount = 0;
			$.each(oData, function() {
				iCount++;
				return;
			});
			if (iCount == 0) {
				return "{}";
			}
			var sHTML = "{";
		}
		var iCount = 0;
		$.each(oData,
				function(sKey, vValue) {
					if (iCount > 0) {
						sHTML += ",";
					}
					if (sDataType == "array") {
						sHTML += ("\n" + sIndent + sIndentStyle);
					} else {
						sHTML += ("\n" + sIndent + sIndentStyle + "\"" + sKey
								+ "\"" + ": ");
					}

					switch (RealTypeOf(vValue)) {
					case "array":
					case "object":
						sHTML += FormatJSON(vValue, (sIndent + sIndentStyle));
						break;
					case "boolean":
					case "number":
						sHTML += vValue.toString();
						break;
					case "null":
						sHTML += "null";
						break;
					case "string":
						sHTML += ("\"" + vValue + "\"");
						break;
					default:
						sHTML += ("TYPEOF: " + typeof (vValue));
					}
					iCount++;
				});
		if (sDataType == "array") {
			sHTML += ("\n" + sIndent + "]");
		} else {
			sHTML += ("\n" + sIndent + "}");
		}
		return sHTML;
	}
</script>

<script type="text/javascript">
	function processOutput(data, outputid) {
		y = FormatJSON(data, "");
		$(outputid).val(y);
	}

	function callServerEndpoint(url, outputid) {
		$.getJSON(url, function(data) {
			processOutput(data, outputid);
		});
	}

	$(document).ready(
			function() {

				$("#quote").click(
						function() {
							service = $("#service").val();
							method = $("#method").val();
							ticker = $("#ticker").val();
							url = "sherpa?endpoint=" + service + "&action="
									+ method + "&ticker=" + ticker;
							callServerEndpoint(url, "#output");
							return false;
						});

				$("#add").click(
						function() {
							service = $("#addendpoint").val();
							method = $("#addmethod").val();
							x = $("#x").val();
							y = $("#y").val();
							url = "sherpa?endpoint=" + service + "&action="
									+ method + "&x_value=" + x + "&y_value=" + y;
							callServerEndpoint(url, "#output");
							return false;
						});
	
				$("#hw").click(
						function() {
							service = $("#hwendpoint").val();
							method = $("#hwaction").val();
							url = "sherpa?endpoint=" + service + "&action="
									+ method;
							callServerEndpoint(url, "#output");
							return false;
						});
				
				$("#dates").click(
						function() {
							service = $("#datesendpoint").val();
							method = $("#datesaction").val();
							date = $("#date").val();
							days = $("#days").val();
							url = "sherpa?endpoint=" + service + "&action="
									+ method + "&date="+date+"&days="+days;
							callServerEndpoint(url, "#output");
							return false;
						});
				
				
				
				
				
				$("#authenticate").click(
						function() {
							method = $("#action").val();
							userid = $("#userid").val();
							password = $("#password").val();
							url = "sherpa?action=" + method + "&userid="
									+ userid + "&password=" + password;
							callServerEndpoint(url, "#output");
							return false;
						});

				
				$("#sessions").click(
						function() {
							method = $("#sessionsaction").val();
							userid = $("#adminuserid").val();
							password = $("#adminpassword").val();
							url = "sherpa?action=" + method + "&userid="
									+ userid + "&password=" + password;
							callServerEndpoint(url, "#output");
							return false;
						});
				
				
				$("#deactivate").click(
						function() {
							method = $("#deactivateaction").val();
							userid = $("#deactivateadminuserid").val();
							password = $("#deactivateadminpassword").val();
							deactivate = $("#deactivateid").val();
							url = "sherpa?action=" + method + "&userid="
									+ userid + "&password=" + password + "&deactivate="+deactivate;
							callServerEndpoint(url, "#output");
							return false;
						});
				
				
				
				$("#authenticated-endpoint").click(
						function() {
							endpoint = $("#endpoint-a").val();
							method = $("#action-a").val();
							userid = $("#userid-a").val();
							token = $("#token-a").val();
							url = "sherpa?endpoint=" + endpoint + "&action="
									+ method + "&userid=" + userid + "&token="
									+ token;
							callServerEndpoint(url, "#output");
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
		
		
		<!-- Add days to a date -->

		</br> <b>Add days to a date</b> </br>

			@Endpoint Service class <input type="input" id="datesendpoint" name="endpoint" size="50" value="TestService" />
				 </br>
			 Method <input type="input" id="datesaction" name="datesaction" size="50" value="addDays" /> 
			    </br>
			Date <input type="input" id="date" name="date" size="50" value="04/05/2012"/>
			      </br>
			Days to add <input type="input" id="days" name=days" size="50" value="365"/>
			     </br> 
			<input id="dates" type="submit" name="submit" />

		<br />

		<br /> <b>Get Authentication Token</b></br>
		<form enctype="multipart/form-data" method="get"
			action="SherpaServlet">
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
			action="SherpaServlet">
			User id <input id="userid-a" type="input" name="userid" size="50"
				value="dpitt@keyholesoftware.com" readonly="true" /> </br> Enter Token <input
				id="token-a" type="input" name="token" size="50" /> </br> @Endpoint <input
				id="endpoint-a" type="input" name="endpoint" size="50"
				value="AuthenticatedService" /> </br> Method 
				<input id="action-a" type="input" name="action" size="50" value="departments" /> </br> </br> <input
				id="authenticated-endpoint" type="submit" name="submit" />
		</form>

	
		
		</br>


	</div>
</div>














