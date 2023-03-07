/* == 1. Delete sections not required == */ 
-- Choices
-- DELETE FROM layout_options where form_id = 'DEM' AND group_id = 3; 
-- DELETE FROM layout_group_properties where grp_form_id = 'DEM' AND grp_group_id = 3;

-- Employer
-- DELETE FROM layout_options where form_id = 'DEM' AND group_id = 4; 
-- DELETE FROM layout_group_properties where grp_form_id = 'DEM' AND grp_group_id = 4;

-- Guardian
-- DELETE FROM layout_options where form_id = 'DEM' AND group_id = 8;
-- DELETE FROM layout_group_properties where grp_form_id = 'DEM' AND grp_group_id = 8;

---------------------------------------------------------------------------------
--- LEARNING: Deleting these sections causes an error while creating patients --- 
---------------------------------------------------------------------------------


/* == 2. Hide fields not required in Who Section == */ 
-- Birth First Name
-- Birth Middle Name
-- Birth Last Name
-- Gender Identity
-- Sexual Orientation
-- License/ID
-- User Defined 1
-- User Defined 2
-- User Defined 3
-- User Defined 4
-- Billing Note
-- Previous Names

UPDATE layout_options 
SET UOR =0
WHERE
form_id = 'DEM' AND 
field_id in (
	'birth_fname',
	'birth_mname',
	'birth_lname',
	'gender_identity',
	'sexual_orientation',
	'drivers_license',
	'genericname1',
	'genericname2',
	'genericval1',
	'genericval2',
	'billing_note',
	'name_history'
);

/* == 3. Rename fields and Reorder Fields in Who Section == */ 
-- External ID: MRN, First field
UPDATE layout_options SET title = 'MRN', seq = 5, titlecols = 1, datacols = 3, uor = 2 
WHERE form_id = 'DEM' AND field_id = 'pubpid'; 

-- SS >> Aadhard Card
UPDATE layout_options SET title = 'Aadhard Card' WHERE form_id = 'DEM' AND field_id = 'ss'; 

/* == 4. Hide fields fields not required in Contact Section == */ 
-- County
-- Mother`s Name
-- Emergency Contact
-- Emergency Phone
-- Home Phone
-- Work Phone
-- Trusted Email
UPDATE layout_options SET UOR =0
WHERE form_id = 'DEM' AND 
field_id in (
	'county',
	'mothersname',
	'contact_relationship',
	'phone_contact',
	'phone_home',
	'phone_biz',
	'email_direct'
);

/* == 5. Hide fields fields not required in Stats Section == */ 
UPDATE layout_options SET UOR =0
WHERE form_id = 'DEM' AND 
field_id in (
'ethnicity',
'financial_review',
'homeless',
'interpretter',
'contrastart',
'vfc'
);


