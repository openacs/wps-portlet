ad_page_contract {
    @author Rocael Hernandez (roc@viaro.net)
    @creation-date 2003-05-24
   
} -properties {
    
}

array set config $cf

set shaded_p $config(shaded_p)
set list_of_package_ids $config(package_id)
set package_id [lindex $list_of_package_ids 0]
set one_instance_p [ad_decode [llength $list_of_package_ids] 1 1 0]
set user_id [ad_verify_and_get_user_id]

set counter 0
db_multirow presentations select_presentations { *SQL* } {
    incr counter
    # we don't want to fill the users portlet with 1000 presentations! roc@viaro.net
    # specially true in users portal page, we do it this way because the lack of oracle 
    # on limiting the amount of rows returned
    if {$counter > 25} {break}
}

if {${presentations:rowcount} == 1} {
    set presentation_name [lindex [array get {presentations:1} pres_title] 1]
    set presentation_url [lindex [array get {presentations:1} url] 1]
    set presentation_id [lindex [array get {presentations:1} pres_item_id] 1]

}




