'<table>  <td rowspan="2" width="60" align="left" > '||CASE WHEN "Sales"."Net Pro Sales Amt LY" = 0 THEN '100' ELSE REPLACE(cast((abs(IfNull("Sales"."Net Pro Sales Amt",0)-IfNull("Sales"."Net Pro Sales Amt LY",0))/IfNull("Sales"."Net Pro Sales Amt LY",IfNull("Sales"."Net Pro Sales Amt",1)))*100 as varchar(30)),'.00',' ') END||' % </td> <td> <table> <td>TY </td>  <td width=  '||cast(cast(IfNull("Sales"."Net Pro Sales Amt",0) as double) / ((IfNull("Sales"."Net Pro Sales Amt",0))+(IfNull("Sales"."Net Pro Sales Amt LY",IfNull("Sales"."Net Pro Sales Amt",1))))*100 as varchar(30))||'   bgcolor=#a6cce2 height=1  title='||REPLACE(cast(ROUND(IfNull("Sales"."Net Pro Sales Amt",0),0) as varchar(30)),'.00',' ')||'> </td> </table> </td> <tr> <td> <table> <td>LY</td>  <td width=  '||cast(cast(IfNull("Sales"."Net Pro Sales Amt LY",0) as double) / ((IfNull("Sales"."Net Pro Sales Amt",0))+(IfNull("Sales"."Net Pro Sales Amt LY",IfNull("Sales"."Net Pro Sales Amt",1))))*100 as varchar(30))||'   bgcolor=#2276b5 height=1 title='||REPLACE(cast(ROUND(IfNull("Sales"."Net Pro Sales Amt LY",0),0) as varchar(30)),'.00',' ')||'> </td> </table> </td> </tr> </table>'





<h2 style="text-align:right;">Run Date as of (@{biServer.variables['CurrentDate']}</h2>


W_RTL_SLSPR_PC_IT_LC_DY_A
W_RTL_SLSPR_PE_IT_LC_DY_A
W_RTL_SLSPR_PP_IT_LC_DY_A

select row_wid,mcal_day_dt from w_mcal_day_d where row_wid= (select mcal_wid from w_rtl_curr_mcal_g where mcal_type='DT')

Select 
 sum(MFPCPC_SLS_RTL_AMT) SALESYTD, SUM(MFPCPR_MARGIN_RTL_AMT) MARGINYTD,PROD_DH_WID, ORG_DH_WID, (select mcal_wid from w_rtl_curr_mcal_g where mcal_type='DT') DT_WID
FROM W_RTL_MFPOP_PROD1_LC1_T1_F FACT_TAB ,
  W_RTL_CURR_MCAL_G CAL
, W_MCAL_WEEK_D WEEK
WHERE CAL.MCAL_TYPE='DT' AND
FACT_TAB.MCAL_WID = WEEK.ROW_WID AND
FACT_TAB.MCAL_WID <= (SELECT MCAL_WID FROM W_RTL_CURR_MCAL_G WHERE MCAL_TYPE='WK') AND
WEEK.MCAL_YEAR_WID = (SELECT MCAL_YEAR_WID FROM W_MCAL_WEEK_D WHERE ROW_WID = (SELECT MCAL_WID FROM W_RTL_CURR_MCAL_G WHERE MCAL_TYPE='WK'))
GROUP BY PROD_DH_WID, ORG_DH_WID


(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)(HOST = langka.metroretail.com.ph)(PORT = 1522))(CONNECT_DATA = (SERVER = DEDICATED)(SID =RIQA)))