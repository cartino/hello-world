proc import datafile="C:\temp\test.csv"
     out=shoes
     dbms=csv
     replace;
     getnames=no;
run;

proc print;
run;