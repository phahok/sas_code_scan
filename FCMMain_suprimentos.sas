/******************************************************************************\
* $Id: FCMMain.sas,v 1.1.2.6.4.3.4.1 2013/10/30 15:38:22 saswai Exp $
*
* Copyright(c) 2011 SAS Institute Inc., Cary, NC, USA. All Rights Reserved.
*
* Name:  FCMMAIN.sas
*
* Purpose: This code is the starting point for the MVA code of FCM.  It's primary
*          purpose is to provide a .sas program that a scheduler can call.
*
* Author: 
*
* Support: SAS(r) Solutions OnDemand
*
* Input:   None
* 
* Output:  None
*
* Parameters:
*
* Dependencies/Assumptions: 
*
* Usage:  This code is the starting point of the MVA execution of the 
*	  FCM product.
*
* History:
* ddmmmyyyy userid	description (Change Code)
\******************************************************************************/

%let datahora = %sysfunc(datetime());
%let datahora = %sysfunc(putn(&datahora.,datetime19.)); 
%let datahora = %sysfunc(compress(&datahora.,':'));

%let regra = %sysget(ID);

%let data = %sysget(DATA);

 
run;

proc printto log="/sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/log_RODA_FCM/RODA_FCM_&regra._&datahora..log" new;
run;

/*proc printto log="/sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/log_RODA_FCM/RODA_FCM_&DATA..log" ;
run;*/



%include "/sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/autoexec_suprimentos.sas";run;

%fcm_controller
