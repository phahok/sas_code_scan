/** versão 22/03/2021***/


/*------------------------------------------------------------------------------*/
/*																				*/
/*	Nesta etapa sera rodado o FCM e consequentemente as regras, pre e pos code 	*/
/*																				*/
/*------------------------------------------------------------------------------*/

x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos/_scenario_view.sas7bdat";
x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos/_successfully_run.sas7bdat";
x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos/final_scenario_summary.sas7bdat";
x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos/proj_actionable_entity_view.sas7bdat";
x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos/proj_by_variable_view.sas7bdat";
x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos/proj_calc_field_view.sas7bdat";
x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos/proj_parameter_view.sas7bdat";
x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos/alert_summary.sas7bdat";
x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos/_alert_summary.sas7bdat";
x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos/_successfully_run.sas7bdat";
x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos/fcm_performance_metric.sas7bdat";
x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos/job_cal_dt_error.sas7bdat";
x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos/enriched_alert_summary.sas7bdat";
x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/stage_suprimentos/processed_dttm.sas7bdat";


x
"rm /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/logs/armlog.log";

/*Inclusão devido projeto DEVOPS*/
%include '/sasdata/includes/libname/metadado.sas';

libname fcm ODBC DSN=SASFCM authdomain=fcmDBAuth schema=FCM_PADRAO
reread_exposure=yes
read_lock_type=row
update_lock_type=row
connection=unique;

x
"cd /sasconfig/Lev1/Applications/SASFinancialCrimesMonitor/Project_FCM_Autoexec/Suprimentos/";

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 autoexec_suprimentos.sas";



/*_______________GC3_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_CONTRATO_AUDITORIA_EXTERNA_GC3';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GC3'";



/*_______________GC4_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_CONTRATO_DERIVATIVOS_EMBUTIDOS_GC4';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GC4'";



/*_______________SI1_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_CONTROLE_CADASTRO_SI1';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'SI1'";



/*_______________SI10_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_USUARIO_ANALISTA_LIDER_SI10';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'SI10'";



/*_______________SI11_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_INVENTARIO_SI11';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'SI11'";



/*_______________SI3_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_PEDIDO_S_ELEMENTO_DE_CUSTO_SI3';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'SI3'";


/*_______________SI5_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_CONTROLE_COMPRADOR_SI5';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'SI5'";



/*_______________SI6_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_CONTROLE_REQUISITANTE_SI6';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'SI6'";



/*_______________GC6_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_Comex_Item_ZIPI_GC6';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GC6'";



/*_______________GC5_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_Comex_Incoterm_GC5';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GC5'";



/*_______________SI2_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_Usuario_Aprovador_SRM_SI2';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'SI2'";



/*_______________SI7_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_Usuario_Visualizador_SRM_SI7';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'SI7'";



/*_______________GC7_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_CONTA_FORNECEDOR_GC7';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GC7'";



/*_______________GC2_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_Fornecedor_Desbloqueio_Temporario_GC2';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GC2'";



/*_______________GF1_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_Contratos_por_gestor_GF1';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GF1'";



/*_______________GC12_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_PEDIDO_MAIOR_RC_GC12';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GC12'";



/*_______________GF4_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_CONTROLE_FRS_GF4';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GF4'";



/*_______________SH1_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_Lista_Suja_SH1';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'SH1'";

/*_______________GC1_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_Contrato_Sem_Risco_Fornecedor_GC1';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GC1'";


/*_______________GC9_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_Pedido_Servico_diff_RC_GC9';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GC9'";





/*_______________GP2_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_Controle_Alteracao_Fornecedor_GP2';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GP2'";


/*_______________GC14_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_BENEFICIO_COTRATO_GENERALISTA_GC14';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GC14'";

/*_______________SI12_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_BLOQUEIO_FRS_SI12';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'SI12'";



/*_______________GC15_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_MM_GC_SPS_ACQUISITIONS_GC15';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GC15'";


/*_______________GC16_______________*/

PROC SQL NOPRINT;
	SELECT PROJECT_SK INTO: _PROJECT_SK FROM FCM.FCM_PROJECT WHERE PROJECT_NM = 'SUPRIMENTOS_MM_GC_IVA_INFORMED_CHANGED';
QUIT;

DATA _NULL_;
	_PROJECT_SK = compress("'"||&_PROJECT_SK.||"'");
	call symput("_PROJECT_SK",_PROJECT_SK);
RUN;
%PUT &_PROJECT_SK;

x
"/sasbin/SASFoundation/9.4/bin/sas_u8 FCMMain_suprimentos.sas -set PROJECT &_PROJECT_SK -set ID 'GC16'";

/*aprovada em 26/04/2021 - inclusão da GC16*/





