 INDEXCOL( CASE  VALUEOF(NQ_SESSION."PREFERRED_CURRENCY") WHEN 'Local Currency' THEN 0 WHEN 'Document Currency' THEN 0 WHEN 'Global Currency 1' THEN 2 WHEN 'Global Currency 2' THEN 3 WHEN 'Global Currency 3' THEN 4 ELSE 5 END , "Oracle Data Warehouse"."Catalog"."dbo"."Fact_W_RTL_INV_SC_DY_CUR_A"."INV_SOH_RTL_AMT_LCL", "Oracle Data Warehouse"."Catalog"."dbo"."Fact_W_RTL_INV_SC_DY_CUR_A"."INV_SOH_RTL_AMT", "Oracle Data Warehouse"."Catalog"."dbo"."Fact_W_RTL_INV_SC_DY_CUR_A"."INV_SOH_RTL_AMT_GLOBAL1", "Oracle Data Warehouse"."Catalog"."dbo"."Fact_W_RTL_INV_SC_DY_CUR_A"."INV_SOH_RTL_AMT_GLOBAL2", "Oracle Data Warehouse"."Catalog"."dbo"."Fact_W_RTL_INV_SC_DY_CUR_A"."INV_SOH_RTL_AMT_GLOBAL3",  CAST ( NULL  AS DOUBLE PRECISION ))
 
 
 IFNULL(IFNULL("Inventory Position"."Ending Inventory Retail LY", 0) / ("Sales"."Avg LY Sales Forward" * (1 + (1- "Sales"."Past 8 weeks- Avg Weekly Sls TY"/"Sales"."Past 8 weeks- Avg Weekly Sls LY")))
 
 
 
SELECT "Item As-Is"."UDA for KPI"
  FROM "Retail Merchandising Analytics As-Is"."Item As-Is"
WHERE 
  (    
		( '@{udatype}'='Import' 
       AND "Item As-Is"."UDA for KPI" = 1.00
         )
      OR 
	  ('@{udatype}'='Local' 
       AND "Item As-Is"."UDA for KPI" IN ( 2.00, 3.00)
      )
	  OR
	  ('@{udatype}'='(All Column Values)'
	  AND "Item As-Is"."UDA for KPI" IN (1.00, 2.00, 3.00)
	  )
   )