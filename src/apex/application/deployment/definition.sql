prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 100
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2400405578329584
,p_default_application_id=>984337
,p_default_id_offset=>0
,p_default_owner=>'MT_NDBRUIJN'
);
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(15884501925602651)
);
wwv_flow_api.component_end;
end;
/