/*==============================================================================
|
| NAME:    autoexec.sas
| PRODUCT: SAS Financial Crimes Monitor
| SYSTEM:  UNIX/WINDOWS
================================================================================
Copyright (c) 2013 by SAS Institute Inc., Cary, NC 27513 USA
- All rights reserved
==============================================================================*/

%global FCM_INTRADAYONLY FCM_LICENSE_CHECK FCM_ERRORHANDLINGDISABLED FCM_RUNDATE FCM_RUNPRJ FCM_SCENARIO
        FCM_ARRAYDIM FCM_SLIB_NM FCM_ARMLOC FCM_PERSIST_SCENARIO_SUMMARY FCM_PERSIST_METRICS FCM_PROCESSED_DTTM;

%let FCM_ARMLOC = /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/logs;
%let _armexec = 1;
%let FCM_PERSIST_METRICS = 0;            /* 0 means do not persist, 1 means persist */

%let FCM_PERSIST_SCENARIO_SUMMARY = 0;   /* 0 means do not persist, 1 means persist */

%let FCM_SLIB_NM = FCM_SLIB;

%let FCM_INTRADAYONLY = 0;
/*%let FCM_INTRADAYONLY = %sysget(INTRADAY);*/  /* 0=daily,wkly,mnthly   1=intraday */
%let DateTime = %Sysfunc(inputn(%sysget(RUNDATE), DateTime19.));

data _null_;
      if (&DateTime = '') then
            CALL SYMPUT('DateTime', input(put( date()  ,date7.) || ':00:00:00', datetime.));
run;
%let FCM_RUNDATE = %Sysfunc( putN(&DateTime, DATETIME19.));

%let FCM_RUNPRJ = %sysget(PROJECT);
%sysfunc(ifc(
                (&FCM_RUNPRJ ^= ),                                      /* logical expression */
                ,                                                       /* if populated leave as is */
                data _null_;
                      CALL SYMPUT('FCM_RUNPRJ', 'ALL');                 /* if blank set to ALL */
                run;,
                data _null_;                                            /* if missing set to ALL */
                      CALL SYMPUT('FCM_RUNPRJ', 'ALL');
                run;
            )
         );

/* _alert_summary, alert_summary, and other semi_permanent tables */
libname STAGE "/sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos";

/* Cria a tabela com os grupos do SMC */

/*Incluído devido projeto DEVOPS*/
%include '/sasdata/includes/libname/metadado.sas';


/* FCM model tables */
libname fcm ODBC DSN=SASFCM authdomain=fcmDBAuth schema=FCM_PADRAO
   reread_exposure=yes
   read_lock_type=row
   update_lock_type=row
   connection=unique ;


/* SAS SYSTEM OPTIONS - site configurable */
options fmtsearch  = (work fmts sashelp.mapfmts library);
options compress = yes;

/* ----------------------------------------------------- */
/*                                                       */
/* ----------------------------------------------------- */


%let FCM_HOME=/sasbin/SASFoundation/9.4;
%let cmacros=&FCM_HOME/cmacros/fincrmmva;

%let ucmacros=/sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/ucmacros;

%sysmstoreclear;

options mautosource mcompilenote=all sasautos=("&cmacros",sasautos)
mstored sasmstore=libcm;


/* ----------------------------------------------------- */
/*                                                       */
/* ----------------------------------------------------- */
/* Uncompiled macros / Custom code */

filename ucmaclib "&ucmacros";
%include ucmaclib(fcm_alert_summary_template.sas
                  fcm_agp_perf.sas
                  fcm_scoring.sas
                  fcm_reduction.sas

                  /* Customer should list custom files here */

                 );

/* ----------------------------------------------------- */
/*                                                       */
/* ----------------------------------------------------- */


libname libcm "&cmacros" access = READONLY;

/* Execute macros to create views/formats/templates - DO NOT CHANGE THE ORDER OF THESE CALLS! */
%fcm_final_scenario_template
%fcm_format_scenario_type_cd
%fcm_scenario_view
%fcm_proj_actionable_entity_view
%fcm_proj_by_variable_view
%fcm_proj_calc_field_view
%fcm_proj_parameter_view

/* ----------------------------------------------------- */
/*                                                       */
/* ----------------------------------------------------- */

data STAGE.FINAL_SCENARIO_SUMMARY;
        set final_scenario;
run;

%fcm_resume_handler

%fcm_configure_libraries


/* ----------------------------------------------------- */
/*                                                       */
/* -----------------------------------------------------  */
filename scenario "/sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/scenario";
%let FCM_SCENARIO = /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/scenario;
