<?xml version="1.0"?>

<queryset>
    <rdbms><type>postgresql</type><version>7.1</version></rdbms>

    <fullquery name="select_presentations">
        <querytext>
		select o.context_id as package_id, i.item_id as pres_item_id,
			acs_object__name(apm_package__parent_id(o.context_id)) as parent_name,
			p.pres_title,  (select site_node__url(site_nodes.node_id)  from site_nodes  where site_nodes.object_id = o.context_id) as url
	                from cr_items i, cr_wp_presentations p     , acs_objects o
			where o.context_id in  ( [join $list_of_package_ids ", "] )
			and  p.presentation_id = i.live_revision
			and i.item_id = o.object_id
			and   p.public_p = 't'
                    order by i.item_id desc, pres_title

        </querytext>
    </fullquery>

</queryset>

