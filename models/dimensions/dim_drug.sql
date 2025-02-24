SELECT GENERATE_UUID() AS drug_id,
    brnd_name AS brand_name,
    gnrc_name AS generic_name,
    mftr_name AS manufacturer_name
FROM medicare_warehouse_target.prescriptiondrugs
