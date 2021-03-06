--
--  Copyright (C) 2001, 2002 MIT
--
--  This file is part of dotLRN.
--
--  dotLRN is free software; you can redistribute it and/or modify it under the
--  terms of the GNU General Public License as published by the Free Software
--  Foundation; either version 2 of the License, or (at your option) any later
--  version.
--
--  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
--  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
--  details.
--

--
-- /wps-portlet/sql/oracle/wps-portlet-drop.sql
--

-- Drops wps portlet

-- Copyright (C) 2003 MIT
-- @author Rocael Hernandez (roc@viaro.net)
-- @creation-date 2003-05-24

-- $Id$

-- This is free software distributed under the terms of the GNU Public
-- License version 2 or higher.  Full text of the license is available
-- from the GNU Project: http://www.fsf.org/copyleft/gpl.html
--
-- PostGreSQL port samir@symphinity.com
--


create function inline_1()
returns integer as '
declare  
  ds_id portal_datasources.datasource_id%TYPE;
begin

  select datasource_id into ds_id
      from portal_datasources
     where name = ''wps_portlet'';

   if not found then
     RAISE EXCEPTION '' No datasource id found '', ds_id;
     ds_id := null;
   end if;

  if ds_id is NOT null then
    perform portal_datasource__delete(ds_id);
  end if;

	-- drop the hooks
	perform acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''wps_portlet'',
	       ''GetMyName''
	);

	perform acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''wps_portlet'',
	       ''GetPrettyName''
	);


	perform acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''wps_portlet'',
	       ''Link''
	);

	perform acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''wps_portlet'',
	       ''AddSelfToPage''
	);

	perform acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''wps_portlet'',
	       ''Show''
	);

	perform acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''wps_portlet'',
	       ''Edit''
	);

	perform acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''wps_portlet'',
	       ''RemoveSelfFromPage''
	);

	-- Drop the binding
	perform acs_sc_binding__delete (
	    ''portal_datasource'',
	    ''wps_portlet''
	);

	-- drop the impl
	perform acs_sc_impl__delete (
		''portal_datasource'',
		''wps_portlet''
	);
  	
	return 0;
end;' language 'plpgsql';

select inline_1();
drop function inline_1();

\i wps-admin-portlet-drop.sql




