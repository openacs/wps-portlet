<%
#	@author Rocael Hernandez (roc@viaro.net)
%>

<if @shaded_p@ ne "t">
  <if @presentations:rowcount@ gt 1>
	<%
  	set new_package_id ""
	set old_package_id ""
	%>
	<if @one_instance_p@ false>
		<table border="0" bgcolor="white" cellpadding="2" cellspacing="3" width="100%">
 			<tr>
				<td><strong>Name</strong></td>
				<td><strong>Group</strong></td>
			</tr>
	</if>
	<multiple name="presentations">
    	<% set new_package_id $presentations(package_id) %>
     	<if @one_instance_p@ false and @new_package_id@ ne @old_package_id@>
		<tr>
	</if>
	<if @one_instance_p@>
      		<li>
	 	<a href="@presentations.url@display/@presentations.pres_item_id@/">@presentations.pres_title@</a> 
		&nbsp;[&nbsp;<a href="@presentations.url@presentation-print-view.tcl?item_id=@presentations.pres_item_id@">Print View</a>&nbsp;]
		</li>
	</if>
   	<else>
		<if @presentations.rownum@ odd>
			<tr bgcolor="#eeeeee">
		</if>
   		<else>
			<tr bgcolor="#ffffff">
		</else>
   		<td><a href="@presentations.url@display/@presentations.pres_item_id@/">@presentations.pres_title@</a> 			
		&nbsp;[&nbsp;<a href="@presentations.url@presentation-print-view.tcl?item_id=@presentations.pres_item_id@">Print View</a>&nbsp;]
		</td>
   		<td>@presentations.parent_name@</td>
   		</tr>
	</else>

	<% set old_package_id $new_package_id %>
    	<if @one_instance_p@ false and @new_package_id@ ne @old_package_id@>
		</tr>
    	</if>
	</multiple>
    	<if @one_instance_p@ false>
  		</table>
  	</if>
  </if>
  <else>
 	<if @presentations:rowcount@ eq 1>
      		<li>
	 	<a href="@presentation_url@display/@presentation_id@/"> @presentation_name@ </a>
		&nbsp;[&nbsp;<a href="@presentation_url@presentation-print-view.tcl?item_id=@presentation_id@">Print View</a>&nbsp;]
		</li>
	</if>
	<else>
        <small>No Presentations Available</small>
  	</else>
  </else>
</if>
<else>
&nbsp;
</else>


