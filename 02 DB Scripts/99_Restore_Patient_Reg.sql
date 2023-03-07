-- Add back deleted columns
ALTER TABLE patient_data ADD COLUMN occupation longtext;
ALTER TABLE patient_data ADD COLUMN pharmacy_id int NOT NULL DEFAULT '0';
ALTER TABLE patient_data ADD COLUMN ref_providerID int DEFAULT NULL;
ALTER TABLE patient_data ADD COLUMN hipaa_mail varchar(3) NOT NULL DEFAULT '';
ALTER TABLE patient_data ADD COLUMN hipaa_voice varchar(3) NOT NULL DEFAULT '';
ALTER TABLE patient_data ADD COLUMN hipaa_notice varchar(3) NOT NULL DEFAULT '';
ALTER TABLE patient_data ADD COLUMN hipaa_message varchar(20) NOT NULL DEFAULT '';
ALTER TABLE patient_data ADD COLUMN guardiansname text;
ALTER TABLE patient_data ADD COLUMN allow_imm_reg_use varchar(255) NOT NULL DEFAULT '';
ALTER TABLE patient_data ADD COLUMN allow_imm_info_share varchar(255) NOT NULL DEFAULT '';
ALTER TABLE patient_data ADD COLUMN allow_health_info_ex varchar(255) NOT NULL DEFAULT '';
ALTER TABLE patient_data ADD COLUMN industry text;
ALTER TABLE patient_data ADD COLUMN imm_reg_status text;
ALTER TABLE patient_data ADD COLUMN imm_reg_stat_effdate text;
ALTER TABLE patient_data ADD COLUMN publicity_code text;
ALTER TABLE patient_data ADD COLUMN publ_code_eff_date text;
ALTER TABLE patient_data ADD COLUMN protect_indicator text;
ALTER TABLE patient_data ADD COLUMN prot_indi_effdate text;
ALTER TABLE patient_data ADD COLUMN guardianrelationship text;
ALTER TABLE patient_data ADD COLUMN guardiansex text;
ALTER TABLE patient_data ADD COLUMN guardianaddress text;
ALTER TABLE patient_data ADD COLUMN guardiancity text;
ALTER TABLE patient_data ADD COLUMN guardianstate text;
ALTER TABLE patient_data ADD COLUMN guardianpostalcode text;
ALTER TABLE patient_data ADD COLUMN guardiancountry text;
ALTER TABLE patient_data ADD COLUMN guardianphone text;
ALTER TABLE patient_data ADD COLUMN guardianworkphone text;
ALTER TABLE patient_data ADD COLUMN guardianemail text;
ALTER TABLE patient_data ADD COLUMN prevent_portal_apps text;
ALTER TABLE patient_data ADD COLUMN provider_since_date tinytext;

-- Add records to layout_group_properties
INSERT INTO openemr.layout_group_properties
(grp_form_id, grp_group_id, grp_title, grp_subtitle, grp_mapping, grp_seq, grp_activity, grp_repeats, grp_columns, grp_size, grp_issue_type, grp_aco_spec, grp_save_close, grp_init_open, grp_referrals, grp_unchecked, grp_services, grp_products, grp_diags, grp_last_update)
VALUES('DEM', '3', 'Choices', '', '', 0, 1, 0, 0, 0, '', '', 0, 0, 0, 0, '', '', '', NULL);
INSERT INTO openemr.layout_group_properties
(grp_form_id, grp_group_id, grp_title, grp_subtitle, grp_mapping, grp_seq, grp_activity, grp_repeats, grp_columns, grp_size, grp_issue_type, grp_aco_spec, grp_save_close, grp_init_open, grp_referrals, grp_unchecked, grp_services, grp_products, grp_diags, grp_last_update)
VALUES('DEM', '4', 'Employer', '', '', 0, 1, 0, 0, 0, '', '', 0, 0, 0, 0, '', '', '', NULL);
INSERT INTO openemr.layout_group_properties
(grp_form_id, grp_group_id, grp_title, grp_subtitle, grp_mapping, grp_seq, grp_activity, grp_repeats, grp_columns, grp_size, grp_issue_type, grp_aco_spec, grp_save_close, grp_init_open, grp_referrals, grp_unchecked, grp_services, grp_products, grp_diags, grp_last_update)
VALUES('DEM', '8', 'Guardian', '', '', 0, 1, 0, 0, 0, '', '', 0, 0, 0, 0, '', '', '', NULL);


-- Add records to layout_options
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'providerID', '3', 'Provider', 10, 11, 1, 0, 0, '', 1, 1, '', '', 'Provider', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'provider_since_date', '3', 'Provide Since Date', 15, 4, 1, 10, 10, '', 1, 1, '', '', 'Patient assigned provider since date.', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'ref_providerID', '3', 'Referring Provider', 20, 11, 1, 0, 0, '', 1, 3, '', '["EP"]', 'Referring Provider', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'pharmacy_id', '3', 'Pharmacy', 30, 12, 1, 0, 0, '', 1, 3, '', '', 'Preferred Pharmacy', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'hipaa_notice', '3', 'HIPAA Notice Received', 40, 1, 1, 0, 0, 'yesno', 1, 1, '', '', 'Did you receive a copy of the HIPAA Notice?', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'hipaa_voice', '3', 'Allow Voice Message', 50, 1, 1, 0, 0, 'yesno', 1, 1, '', '', 'Allow telephone messages?', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'hipaa_message', '3', 'Leave Message With', 60, 2, 1, 20, 63, '', 1, 1, '', '', 'With whom may we leave a message?', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'hipaa_mail', '3', 'Allow Mail Message', 70, 1, 1, 0, 0, 'yesno', 1, 1, '', '', 'Allow email messages?', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'hipaa_allowsms', '3', 'Allow SMS', 80, 1, 1, 0, 0, 'yesno', 1, 1, '', '', 'Allow SMS (text messages)?', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'hipaa_allowemail', '3', 'Allow Email', 90, 1, 1, 0, 0, 'yesno', 1, 1, '', '', 'Allow Email?', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'allow_imm_reg_use', '3', 'Allow Immunization Registry Use', 100, 1, 1, 0, 0, 'yesno', 1, 1, '', '', '', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'allow_imm_info_share', '3', 'Allow Immunization Info Sharing', 110, 1, 1, 0, 0, 'yesno', 1, 1, '', '', '', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'allow_health_info_ex', '3', 'Allow Health Information Exchange', 120, 1, 1, 0, 0, 'yesno', 1, 1, '', '', '', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'allow_patient_portal', '3', 'Allow Patient Portal', 130, 1, 1, 0, 0, 'yesno', 1, 1, '', '', '', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'prevent_portal_apps', '3', 'Prevent API Access', 135, 21, 1, 0, 0, '', 1, 1, '', '', 'Check to not allow third party API access.', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'cmsportal_login', '3', 'CMS Portal Login', 140, 2, 1, 30, 60, '', 1, 1, '', '', 'CMS Portal Login ID', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'imm_reg_status', '3', 'Immunization Registry Status', 150, 1, 1, 1, 0, 'immunization_registry_status', 1, 1, '', '', 'Immunization Registry Status', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'imm_reg_stat_effdate', '3', 'Immunization Registry Status Effective Date', 160, 4, 1, 10, 10, '', 1, 1, '', '', 'Immunization Registry Status Effective Date', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'publicity_code', '3', 'Publicity Code', 170, 1, 1, 1, 0, 'publicity_code', 1, 1, '', '', 'Publicity Code', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'publ_code_eff_date', '3', 'Publicity Code Effective Date', 180, 4, 1, 10, 10, '', 1, 1, '', '', 'Publicity Code Effective Date', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'protect_indicator', '3', 'Protection Indicator', 190, 1, 1, 1, 0, 'yesno', 1, 1, '', '', 'Protection Indicator', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'prot_indi_effdate', '3', 'Protection Indicator Effective Date', 200, 4, 1, 10, 10, '', 1, 1, '', '', 'Protection Indicator Effective Date', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'care_team_provider', '3', 'Care Team (Provider)', 210, 45, 1, 0, 0, '', 1, 1, '', '["EP"]', '', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'care_team_status', '3', 'Care Team Status', 220, 1, 1, 0, 0, 'Care_Team_Status', 1, 1, '', '["EP"]', 'Indicates whether the care team is current , represents future intentions or is now a historical record.', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'care_team_facility', '3', 'Care Team (Facility)', 230, 44, 1, 0, 0, '', 1, 1, '', '["EP"]', '', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'patient_groups', '3', 'Patient Categories', 240, 36, 1, 0, 0, 'Patient_Groupings', 1, 1, '', '["EP","DAP"]', 'Add patient to one or more category.', 0, '', 'F', '', '', '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'occupation', '4', 'Occupation', 1, 2, 1, 20, 63, '', 1, 1, '', 'C', 'Occupation', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'industry', '4', 'Industry', 2, 26, 1, 0, 0, 'Industry', 1, 1, '', '', 'Industry', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'em_name', '4', 'Employer Name', 3, 2, 1, 20, 63, '', 1, 1, '', 'C', 'Employer Name', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'em_street', '4', 'Employer Address', 4, 2, 1, 25, 63, '', 1, 1, '', 'C', 'Street and Number', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'em_street_line_2', '4', 'Employer Address Line 2', 5, 2, 1, 25, 63, '', 1, 1, '', 'C', 'Address Line 2', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'em_city', '4', 'City', 6, 2, 1, 15, 63, '', 1, 1, '', 'C', 'City Name', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'em_state', '4', 'State', 7, 26, 1, 0, 0, 'state', 1, 1, '', '', 'State/Locality', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'em_postal_code', '4', 'Postal Code', 8, 2, 1, 6, 63, '', 1, 1, '', '', 'Postal Code', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'em_country', '4', 'Country', 9, 26, 1, 0, 0, 'country', 1, 1, '', '', 'Country', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'guardiansname', '8', 'Name', 10, 2, 1, 25, 63, '', 1, 1, '', '', 'Guardian Name', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'guardianrelationship', '8', 'Relationship', 20, 1, 1, 0, 0, 'next_of_kin_relationship', 1, 1, '', '', 'Relationship', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'guardiansex', '8', 'Sex', 30, 1, 1, 0, 0, 'sex', 1, 1, '', '', 'Sex', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'guardianaddress', '8', 'Address', 40, 2, 1, 25, 63, '', 1, 1, '', '', 'Address', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'guardiancity', '8', 'City', 50, 2, 1, 15, 63, '', 1, 1, '', '', 'City', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'guardianstate', '8', 'State', 60, 26, 1, 0, 0, 'state', 1, 1, '', '', 'State', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'guardianpostalcode', '8', 'Postal Code', 70, 2, 1, 6, 63, '', 1, 1, '', '', 'Postal Code', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'guardiancountry', '8', 'Country', 80, 26, 1, 0, 0, 'country', 1, 1, '', '', 'Country', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'guardianphone', '8', 'Phone', 90, 2, 1, 20, 63, '', 1, 1, '', '', 'Phone', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'guardianworkphone', '8', 'Work Phone', 100, 2, 1, 20, 63, '', 1, 1, '', '', 'Work Phone', 0, '', 'F', NULL, NULL, '');
INSERT INTO openemr.layout_options
(form_id, field_id, group_id, title, seq, data_type, uor, fld_length, max_length, list_id, titlecols, datacols, default_value, edit_options, description, fld_rows, list_backup_id, source, conditions, validation, codes)
VALUES('DEM', 'guardianemail', '8', 'Email', 110, 2, 1, 20, 63, '', 1, 1, '', '', 'Guardian Email Address', 0, '', 'F', NULL, NULL, '');
