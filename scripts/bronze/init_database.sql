Créer la base de données et les schémas
=============================================================
Objectif du script :
    Ce script crée une nouvelle base de données nommée 'DataWarehouse' après avoir vérifié si elle existe déjà.
    Si la base de données existe, elle est supprimée puis recréée. De plus, le script configure trois schémas
    dans la base de données : 'bronze', 'silver' et 'gold'.

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Créer les schémas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
