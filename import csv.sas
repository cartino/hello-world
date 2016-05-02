proc import datafile="D:\Users\MARROSSI\Desktop\Areu_18_04_16_comuni.csv"
     out=comuni
     dbms=csv
     replace; delimiter=';' ;
     getnames=yes ;
run;
