(IFNULL(IFNULL(CAST(FILTER("Sales"."Transaction Count YTD" USING ("Customer"."Metro Customer Type" = 'Retail Customer')) as DOUBLE), 0) / IFNULL(CAST(FILTER("Sales"."Transaction Count YTD LY" USING ("Customer"."Metro Customer Type" = 'Retail Customer')) AS DOUBLE), 0), 0)-1) * 100



(1-IFNULL((CAST(FILTER("Sales"."Transaction Count YTD" USING ("Customer"."Metro Customer Type" = 'Wholesale Customer')) AS DOUBLE) / CAST(FILTER("Sales"."Transaction Count YTD LY" USING ("Customer"."Metro Customer Type" = 'Wholesale Customer')) AS DOUBLE)),0))*100


TODO list
1. make the changes in the sales transaction table(cast the metrics)
2. you can use the filter for the formula used as they don't hamper in any kind so far.
3. make tables for the sales and margin summary replace the pivot table with normal table
4. make view for the w rtl inc it lc g and insert the current date from the w rtl curr mcal g
5. 



"Business Calendar"."Fiscal Date" = (SELECT "Business Calendar"."Fiscal Date" FROM "Retail Merchandising Analytics As-Is" WHERE "Business Calendar"."Fiscal Date" BETWEEN (select cast("Business Calendar"."Fiscal Period Start Date" as DATE)  from "Retail Merchandising Analytics As-Is" where
"Business Calendar"."Fiscal Date" = VALUEOF(CurrentDate)) AND VALUEOF(CurrentDate))

 SELECT "Business Calendar"."Fiscal Date" FROM  "Retail Merchandising Analytics As-Is" WHERE "Business Calendar"."Fiscal Date" <=  VALUEOF(CurrentDate)  AND  "Business Calendar"."Fiscal Period"  IN (SELECT "Business Calendar"."Fiscal Period" FROM  "Retail Merchandising Analytics As-Is" Where "Business Calendar"."Fiscal Date" = VALUEOF(CurrentDate));
 
 SELECT "Business Calendar"."Fiscal Week" FROM  "Retail Merchandising Analytics As-Is" WHERE "Business Calendar"."Fiscal Week" <=  VALUEOF(CurrentWeek)  AND  "Business Calendar"."Fiscal Period"  IN (SELECT "Business Calendar"."Fiscal Period" FROM  "Retail Merchandising Analytics As-Is" Where "Business Calendar"."Fiscal Week" = VALUEOF(CurrentWeek));
 
 SELECT "Business Calendar"."Fiscal Week" FROM  "Retail Merchandising Analytics As-Is" WHERE "Business Calendar"."Fiscal Date" = VALUEOF(CurrentDate);
 
 
 
 
 
 
 
 
 
 
 
 
 