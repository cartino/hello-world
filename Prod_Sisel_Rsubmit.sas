%let SASsrv=10.220.20.113 7551;

options COMAMID=TCP REMOTE=SASsrv;
dm log 'color note blue';
dm log 'color warning green';
dm log 'color error red';
filename rlink;
signon SASsrv user=rl_sire_adm password=prawr3cH;

options FMTSEARCH = (WORK FORMAT);

rsubmit;
      libname sisel '/progetti/sisel/Dati';
	  /* libname DATI ORACLE user=s379 password=s379 path=SISDIRP schema=s379  access=readonly; */
	  libname DATI ORACLE user=s379 password=s379 path=SISDIrt schema=s379 access=readonly; 
	  libname FORMAT "/sas92datis/project/Lev1/SASApp/SASEnvironment/SASFormats";
	  LIBNAME bck "/progetti/sisel/bck/anteG1a1" access=readonly;
endrsubmit;
	  libname sisel slibref=sisel server=SASsrv;
	  libname dati slibref=dati server=SASsrv;
	  libname FORMAT slibref=FORMAT server=SASsrv;
	  libname bck slibref=bck server=SASsrv;

%PUT AMBIENTE DI PRODUZIONE;