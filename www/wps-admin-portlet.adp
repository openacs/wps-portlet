<%
#	@author Rocael Hernandez (roc@viaro.net)
%>

<ul>
<if @presentations:rowcount@ gt 1>
<multiple name="presentations">
  <li>
    <a href="@url@display/@presentations.pres_item_id@/">@presentations.title@</a> #wps-portlet.lt_created_on_presentati#<a href="@url@presentation-top?pres_item_id=@presentations.pres_item_id@">#wps-portlet.edit#</a>&nbsp;]
  </li>
</multiple>
</ul>
</if>
<else>
        <small>#wps-portlet.lt_No_Presentations_Avai#</small>
</else>
  <br>
  <a href="@url@create-presentation">#wps-portlet.lt_Create_a_new_presenta#</a>

