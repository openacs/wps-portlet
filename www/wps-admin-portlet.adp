<%
#	@author Rocael Hernandez (roc@viaro.net)
%>

<ul>
<if @presentations:rowcount@ gt 1>
<multiple name="presentations">
  <li>
    <a href="@url@display/@presentations.pres_item_id@/">@presentations.title@</a> created on @presentations.creation_date@ 
    &nbsp;[&nbsp;<a href="@url@presentation-top?pres_item_id=@presentations.pres_item_id@">edit</a>&nbsp;]
  </li>
</multiple>
</ul>
</if>
<else>
        <small>No Presentations Available</small>
</else>
  <br>
  <a href="@url@create-presentation">Create a new presentation.</a>
