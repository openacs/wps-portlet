ad_page_contract {
    @author Rocael Hernandez (roc@viaro.net)
    @creation-date 2003-05-24
   
} -properties {
    
}

# Configuration
array set config $cf	

# Should be a list already! 
set list_of_package_ids $config(package_id)

if {[llength $list_of_package_ids] > 1} {
    # We have a problem!
    return -code error "There should be only one instance of Wimpy Point for admin purposes"
}        

set package_id [lindex $list_of_package_ids 0]


set user_id [ad_verify_and_get_user_id]


db_multirow presentations select_presentations {
      
	select i.item_id as pres_item_id,
	p.pres_title as title,
	acs_permission__permission_p(i.item_id, :user_id, 'admin') as admin_p,
	to_char(ao.creation_date, 'Month DD, YYYY') as creation_date
	from cr_items i, cr_wp_presentations p, acs_objects ao
	where i.live_revision = p.presentation_id
	and   ao.object_id = i.item_id
	and   ao.creation_user = :user_id
	and   ao.context_id = :package_id
    
}
	
set url [lindex [site_node::get_url_from_object_id -object_id $package_id] 0]

ad_return_template
