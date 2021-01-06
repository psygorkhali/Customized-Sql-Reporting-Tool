SELECT CASE WHEN "Customer"."Metro Customer Type" = "Wholesale Customer" THEN 'Wholesale Customer' ELSE 'Retail Customer' END FROM "Retail Merchandising Analytics As-Is"."Customer";


SELECT CASE WHEN "Item As-Is"."Purchase Type" = 0 THEN 'Outright' WHEN  "Item As-Is"."Purchase Type" = 1 THEN 'Consignment' ELSE 'Concession' END FROM "Retail Merchandising Analytics As-Is"."Item As-Is";


select a.mcal_period_name_week, a.* from w_mcal_day_d a where mcal_day_dt=(select CAST(mcal_day_dt-28 AS CHARACTER(10)) from w_mcal_day_d where 
row_wid= (select mcal_wid from w_rtl_curr_mcal_g where mcal_type='DT')

TOPN("Sales"."Net Sales Amt", @{TopSales}{10})


CASE WHEN "Customer"."Metro Customer Type" = 'Wholesale Customer' THEN 'Wholesale Customer' ELSE 'Retail Customer' END



CASE WHEN "Item As-Is"."Purchase Type" = 0 THEN 'Outright' WHEN  "Item As-Is"."Purchase Type" = 2 THEN 'Concession' WHEN "Item As-Is"."Purchase Type" IN (0,1,2) THEN '(All Column Values)' ELSE 'Consignment' END

<B>Fiscal Week  <@{biServer.variables['CurrentWeek']}></B>