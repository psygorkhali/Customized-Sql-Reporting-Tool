Status : Failure -Test failed: Listener refused the connection with the following error:
ORA-12505, TNS:listener does not currently know of SID given in connect descriptor
 
 
 
 IFNULL(FILTER("Sales"."Transaction Count QTD LY" USING ("Customer"."Metro Customer Type" = 'Wholesale Customer')), 0)
 
 
 
 IFNULL(FILTER("Sales"."Transaction Count LY" USING ("Customer"."Metro Customer Type" = 'Wholesale Customer')), 0)
 
Select 
 sum(MFPCPC_SLS_RTL_AMT) YTD, PROD_DH_WID, ORG_DH_WID, (select mcal_wid from w_rtl_curr_mcal_g where mcal_type='DT') DT_WID
FROM W_RTL_MFPCP_PROD1_LC1_T1_F FACT_TAB ,
  W_RTL_CURR_MCAL_G CAL
, W_MCAL_WEEK_D WEEK
WHERE CAL.MCAL_TYPE='DT' AND
FACT_TAB.MCAL_WID = WEEK.ROW_WID AND
FACT_TAB.MCAL_WID <= (SELECT MCAL_WID FROM W_RTL_CURR_MCAL_G WHERE MCAL_TYPE='WK') AND
WEEK.MCAL_YEAR_WID = (SELECT MCAL_YEAR_WID FROM W_MCAL_WEEK_D WHERE ROW_WID = (SELECT MCAL_WID FROM W_RTL_CURR_MCAL_G WHERE MCAL_TYPE='WK'))
GROUP BY PROD_DH_WID, ORG_DH_WID

VALUEOF('VARIABLE _NAME')
@{biServer.variables['VARIABLE_NAME']} 