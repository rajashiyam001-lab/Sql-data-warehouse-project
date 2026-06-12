===============================================================================
Procédure stockée : Chargement de la couche Bronze (Source -> Bronze)
===============================================================================
Objectif du script :
    Cette procédure stockée charge les données dans le schéma « bronze » à partir
    de fichiers CSV externes.

    Elle effectue les actions suivantes :
    - Vide (TRUNCATE) les tables de la couche Bronze avant le chargement des données.
    - Utilise la commande `BULK INSERT` pour charger les données des fichiers CSV
      dans les tables du schéma Bronze.
===============================================================================


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN

    PRINT '========================================';
    PRINT 'Chargement de la couche Bronze';
    PRINT '========================================';

    PRINT '----------------------------------------';
    PRINT 'Chargement des tables CRM';
    PRINT '----------------------------------------';

    PRINT '>> Insertion des données dans : bronze.crm_cust_info';

    BULK INSERT bronze.crm_cust_info
    FROM 'C:\Users\rajas\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    SELECT COUNT(*) AS Nombre_Enregistrements
    FROM bronze.crm_cust_info;

    PRINT '>> Insertion des données dans : bronze.crm_prd_info';

    BULK INSERT bronze.crm_prd_info
    FROM 'C:\Users\rajas\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT '>> Insertion des données dans : bronze.crm_sales_details';

    BULK INSERT bronze.crm_sales_details
    FROM 'C:\Users\rajas\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT '----------------------------------------';
    PRINT 'Chargement des tables ERP';
    PRINT '----------------------------------------';

    PRINT '>> Insertion des données dans : bronze.erp_loc_a101';

    BULK INSERT bronze.erp_loc_a101
    FROM 'C:\Users\rajas\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT '>> Insertion des données dans : bronze.erp_cust_az12';

    BULK INSERT bronze.erp_cust_az12
    FROM 'C:\Users\rajas\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT '>> Insertion des données dans : bronze.erp_px_cat_g1v2';

    BULK INSERT bronze.erp_px_cat_g1v2
    FROM 'C:\Users\rajas\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT '========================================';
    PRINT 'Chargement de la couche Bronze terminé';
    PRINT '========================================';

END;
