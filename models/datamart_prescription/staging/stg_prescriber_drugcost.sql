SELECT 
    Prscrbr_NPI AS prscrbr_npi, 
    Prscrbr_Last_Org_Name AS prscrbr_last_org_name,
    Prscrbr_First_Name AS prscrbr_first_name,
    Prscrbr_City AS prscrbr_city, 
    Prscrbr_State_Abrvtn AS prscrbr_state_abrvtn, 
    Prscrbr_Type AS prscrbr_type, 
    Prscrbr_Type_Src AS prscrbr_type_src, 
    REPLACE(Brnd_Name, '*', '') AS brnd_name,  -- Remove * from brnd_name
    REPLACE(Gnrc_Name, '*', '') AS gnrc_name,  -- Remove * from gnrc_name
    Tot_Clms AS tot_clms, 
    Tot_30day_Fills AS tot_30day_fills, 
    Tot_Day_Suply AS tot_day_suply, 
    Tot_Drug_Cst AS tot_drug_cst, 
    Tot_Benes AS tot_benes, 
    year
FROM partdsource.prescribers2018

UNION ALL

SELECT 
    Prscrbr_NPI AS prscrbr_npi, 
    Prscrbr_Last_Org_Name AS prscrbr_last_org_name,
    Prscrbr_First_Name AS prscrbr_first_name,
    Prscrbr_City AS prscrbr_city, 
    Prscrbr_State_Abrvtn AS prscrbr_state_abrvtn, 
    Prscrbr_Type AS prscrbr_type, 
    Prscrbr_Type_Src AS prscrbr_type_src, 
    REPLACE(Brnd_Name, '*', '') AS brnd_name,  -- Remove * from brnd_name
    REPLACE(Gnrc_Name, '*', '') AS gnrc_name,  -- Remove * from gnrc_name
    Tot_Clms AS tot_clms, 
    Tot_30day_Fills AS tot_30day_fills, 
    Tot_Day_Suply AS tot_day_suply, 
    Tot_Drug_Cst AS tot_drug_cst, 
    Tot_Benes AS tot_benes, 
    year
FROM partdsource.prescribers2019

UNION ALL

SELECT 
    Prscrbr_NPI AS prscrbr_npi, 
    Prscrbr_Last_Org_Name AS prscrbr_last_org_name,
    Prscrbr_First_Name AS prscrbr_first_name,
    Prscrbr_City AS prscrbr_city, 
    Prscrbr_State_Abrvtn AS prscrbr_state_abrvtn, 
    Prscrbr_Type AS prscrbr_type, 
    Prscrbr_Type_Src AS prscrbr_type_src, 
    REPLACE(Brnd_Name, '*', '') AS brnd_name,  -- Remove * from brnd_name
    REPLACE(Gnrc_Name, '*', '') AS gnrc_name,  -- Remove * from gnrc_name
    Tot_Clms AS tot_clms, 
    Tot_30day_Fills AS tot_30day_fills, 
    Tot_Day_Suply AS tot_day_suply, 
    Tot_Drug_Cst AS tot_drug_cst, 
    Tot_Benes AS tot_benes, 
    year
FROM partdsource.prescribers2020

UNION ALL

SELECT 
    Prscrbr_NPI AS prscrbr_npi, 
    Prscrbr_Last_Org_Name AS prscrbr_last_org_name,
    Prscrbr_First_Name AS prscrbr_first_name,
    Prscrbr_City AS prscrbr_city, 
    Prscrbr_State_Abrvtn AS prscrbr_state_abrvtn, 
    Prscrbr_Type AS prscrbr_type, 
    Prscrbr_Type_Src AS prscrbr_type_src, 
    REPLACE(Brnd_Name, '*', '') AS brnd_name,  -- Remove * from brnd_name
    REPLACE(Gnrc_Name, '*', '') AS gnrc_name,  -- Remove * from gnrc_name
    Tot_Clms AS tot_clms, 
    Tot_30day_Fills AS tot_30day_fills, 
    Tot_Day_Suply AS tot_day_suply, 
    Tot_Drug_Cst AS tot_drug_cst, 
    Tot_Benes AS tot_benes, 
    year
FROM partdsource.prescribers2021

UNION ALL

SELECT 
    Prscrbr_NPI AS prscrbr_npi, 
    Prscrbr_Last_Org_Name AS prscrbr_last_org_name,
    Prscrbr_First_Name AS prscrbr_first_name,
    Prscrbr_City AS prscrbr_city, 
    Prscrbr_State_Abrvtn AS prscrbr_state_abrvtn, 
    Prscrbr_Type AS prscrbr_type, 
    Prscrbr_Type_Src AS prscrbr_type_src, 
    REPLACE(Brnd_Name, '*', '') AS brnd_name,  -- Remove * from brnd_name
    REPLACE(Gnrc_Name, '*', '') AS gnrc_name,  -- Remove * from gnrc_name
    Tot_Clms AS tot_clms, 
    Tot_30day_Fills AS tot_30day_fills, 
    Tot_Day_Suply AS tot_day_suply, 
    Tot_Drug_Cst AS tot_drug_cst, 
    Tot_Benes AS tot_benes, 
    year
FROM partdsource.prescribers2022
