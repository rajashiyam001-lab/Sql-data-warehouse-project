-- ============================================================================
-- 🔍 Contrôle de qualité : gold.dim_customers
-- ============================================================================
-- Objectif : Vérifier l’unicité de la clé client (customer_key)
-- Attendu  : Aucun résultat (aucun doublon ne doit exister)
-- ============================================================================

SELECT 
    customer_key,
    COUNT(*) AS nombre_doublons
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;


-- ============================================================================
-- 🔍 Contrôle de qualité : gold.dim_products
-- ============================================================================
-- Objectif : Vérifier l’unicité de la clé produit (product_key)
-- Attendu  : Aucun résultat (aucun doublon ne doit exister)
-- ============================================================================

SELECT 
    product_key,
    COUNT(*) AS nombre_doublons
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;


-- ============================================================================
-- 🔗 Contrôle d’intégrité référentielle : gold.fact_sales
-- ============================================================================
-- Objectif : Vérifier la cohérence entre la table de faits et les dimensions
--            (customers & products)
-- Attendu  : Aucun enregistrement manquant dans les dimensions
-- ============================================================================

SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
WHERE p.product_key IS NULL 
   OR c.customer_key IS NULL;
