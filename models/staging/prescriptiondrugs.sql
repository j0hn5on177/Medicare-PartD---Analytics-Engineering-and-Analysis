SELECT 
    Brnd_Name AS brnd_name, 
    Gnrc_Name AS gnrc_name, 
    Tot_Mftr AS tot_mftr, 
    Mftr_Name AS mftr_name, 
    Year AS year, 
    Avg_Spnd_Per_Bene AS avg_spnd_per_bene, 
    Avg_Spnd_Per_Clm AS avg_spnd_per_clm, 
    Avg_Spnd_Per_Dsg_Unt_Wghtd AS avg_spnd_per_dsg_unt_wghtd, 
    Tot_Benes AS tot_benes, 
    Tot_Clms AS tot_clms, 
    Tot_Dsg_Unts AS tot_dsg_unts, 
    Tot_Spndng AS tot_spndng
FROM partdsource.spending_bydrug_18_22