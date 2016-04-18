/*******************************************************************************************************/
/***				SCRIPT PER LA PULIZIA DEI CSV CON LE COORDINATE PER STGEOBRIDGE					 ***/
/**																									  **/
/* Prende in pasto un file csv contenente le coordinate geografiche da utilizzare per StGeoBridge.	   */
/* Solitamente queste coordinate sono sporche a livello di formattazione. questo scritp esegue data    */
/* quality per formattare le coordinate in modo corretto di modo da poterle usare per StGeoBridge.     */
/**																									  **/
/*** Autore: MRossi																					 ***/
/*******************************************************************************************************/


/* imposto i parametri */
%let input = "D:\Users\MARROSSI\Desktop\TMP\mis\analisi_datiSporchi_MIS.csv";
%let output = "D:\Users\MARROSSI\Desktop\TMP\mis\analisi_datiSporchi_MIS_CLEANED.csv";

/* importo il file csv */
proc import datafile=&input. 
     out=datiSporchi_MIS
     dbms=csv
     replace;
	 delimiter=';';
     /*getnames=yes;*/
run;

/* pulisco le colonne relative alle coordinate */
data datiSporchi_MIS_1(drop = VL_GEO_X_WGS VL_GEO_Y_WGS);
set datiSporchi_MIS;
X = compress(tranwrd(VL_GEO_X_WGS, '.', ''));
Y = compress(tranwrd(VL_GEO_Y_WGS, '.', ''));
run;

/* formatto correttamente le coordinate */
data datiSporchi_MIS_2( rename=(x1 = VL_GEO_X_WGS y1 = VL_GEO_Y_WGS)  drop= x y );
set datiSporchi_MIS_1;
if substr(x,1,2)='10' then
X1 = substr(x,1,2) || ',' || substr(x,3);
else 
X1 = substr(x,1,1) || ',' || substr(x,2);
Y1 = substr(y,1,2) || ',' || substr(x,3); 
run;

/* Esporto nuovamente i dati su CSV */
proc export data=work.datiSporchi_MIS_2 
   outfile=&output.
   dbms=csv
   REPLACE;
   delimiter=';';
run;

/* Fine */
