w%let SASsrv=10.220.20.113 7551;

options COMAMID=TCP REMOTE=SASsrv;
dm log 'color note blue';
dm log 'color warning green';
dm log 'color error red';
filename rlink;
signon SASsrv user=rl_sire_adm password=prawr3cH;

options FMTSEARCH = (WORK FORMAT);

rsubmit;
      libname sisel   "/progetti/sisel/Dati";
	  libname bck     "/progetti/sisel/bck/anteG1a1" access=readonly;
	  libname MISds   "/progetti/mis/dati/staging"   compress=yes;
	  libname MISLv0  "/progetti/mis/dati/lv0_ods"   compress=YES;
	  libname MISLv1  "/progetti/mis/dati/lv1_dwh"   compress=YES;
	  libname MISLv2  "/progetti/mis/dati/lv2_dm"    compress=YES;
	  libname library "/progetti/mis/dati/fmt";
	  libname FORMAT  "/sas92datis/project/Lev1/SASApp/SASEnvironment/SASFormats";
	  libname DATI ORACLE user=s379 password=s379 path=SISDIrt schema=s379 access=readonly; 
	  /* libname DATI ORACLE user=s379 password=s379 path=SISDIRP schema=s379  access=readonly; */
endrsubmit;
	  libname sisel    slibref=sisel     server=SASsrv;
	  libname dati     slibref=dati      server=SASsrv;
	  libname FORMAT   slibref=FORMAT    server=SASsrv;
	  libname MISds    slibref=MISds     server=SASsrv;
	  libname MISLv0   slibref=MISLv0    server=SASsrv;
	  libname MISLv1   slibref=MISLv1    server=SASsrv;
	  libname MISLv1   slibref=MISLv1    server=SASsrv;
	  libname MISLv2   slibref=MISLv2    server=SASsrv;
      libname rwork    slibref=work      server=SASsrv;
      libname library  slibref=library   server=SASsrv;

%PUT AMBIENTE DI PRODUZIONE;
