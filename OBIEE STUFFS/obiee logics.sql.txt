SELECT "Item As-Is"."Purchase Type"
  FROM "Retail Merchandising Analytics As-Is"."Item As-Is"
WHERE 
  (    
		( '@{compflashpurchase}'='Concession' 
       AND "Item As-Is"."Purchase Type" = 2
         )
      OR 
	  ('@{compflashpurchase}'='Outright' 
       AND "Item As-Is"."Purchase Type" = 0
      )
   )
   
   
   
SELECT "Customer"."Metro Customer Type" FROM "Retail Merchandising Analytics As-Was" WHERE "Customer"."Metro Customer Type" IS NOT NULL FETCH FIRST 65001 ROWS ONLY


IFNULL(FILTER("Sales"."Transaction Count" USING ("Customer"."Metro Customer Type" = 'Retail Customer')), 0)


(IFNULL(IFNULL(FILTER("Sales"."Transaction Count" USING ("Customer"."Metro Customer Type" = 'Retail Customer')), 0) / IFNULL(FILTER("Sales"."Transaction Count LY" USING ("Customer"."Metro Customer Type" = 'Retail Customer')), 0), 0)-1) * 100

((IFNULL(FILTER("Sales"."Transaction Count" USING ("Retail Customer Analytics As-Is"."Metro Customer"."Metro Customer Type" IN ('Retail Customer', 'Senior Citizen'))), 0) /  IFNULL(FILTER("Sales"."Transaction Count LY" USING ("Retail Customer Analytics As-Is"."Metro Customer"."Metro Customer Type" IN ('Retail Customer', 'Senior Citizen'))), 0))-1)*100

SELECT "Item As-Is"."Purchase Type"
  FROM "Retail Merchandising Analytics As-Is"."Item As-Is"
WHERE 
  (    
		( '@{merchpurchase}'='Concession' 
       AND "Item As-Is"."Purchase Type" = 2
         )
      OR 
	  ('@{merchpurchase}'='Outright' 
       AND "Item As-Is"."Purchase Type" = 0
      )
   )
   
   
   
   SELECT "Customer"."Metro Customer Type"
  FROM "Retail Merchandising Analytics As-Is"."Customer"
WHERE 
  (    
		( '@{orgcustsmr}'='Retail Customer' 
       AND "Customer"."Metro Customer Type" IN ('Retail Customer','Senior Citizen')
         )
      OR 
	  ('@{orgcustsmr}'='Wholesale Customer' 
       AND "Customer"."Metro Customer Type" = 'Wholesale Customer'
      )
   );