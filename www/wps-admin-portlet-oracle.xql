<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="select_presentations">      
      <querytext>
       
	select i.item_id as pres_item_id,
	p.pres_title as title,
	acs_permission.permission_p(i.item_id, :user_id, 'admin') as admin_p,
	to_char(ao.creation_date, 'Month DD, YYYY') as creation_date
	from cr_items i, cr_wp_presentations p, acs_objects ao
	where i.live_revision = p.presentation_id
	and   ao.object_id = i.item_id
	and   ao.creation_user = :user_id
	and   ao.context_id = :package_id
    
      </querytext>
</fullquery>

 
</queryset>
