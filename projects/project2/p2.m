%1-4
clc
clear
[y, Fs] = audioread ('speech.wav');
t=sprintf("%.16f",y(37));
player = audioplayer (y,Fs);
play( player );
h2=histogram(y);
h2val=h2.Values;
h2val=h2val./length(y);
X=h2val;
 len=length(X); 
 entropy= 0;
 for i=1:len 
     if X(i)~=0
        h= X(i)*log2(X(i));  
        entropy = entropy-h; 
     end
 end
 display(entropy)
 display(entropy*length(y)/8000)
 display(length(y)/1000)
 
 
 %5
 uniq=unique(y);
 uniq2 = zeros(1,length(uniq));
 u = zeros(1,length(uniq)+1);
 for i=1:length(uniq)
    uniq2(i)=uniq(i) ;
    u(i)=uniq(i);
 end
 u(length(uniq)+1)=2;
 hist=histogram(y,u);
 res=hist.Values./length(y);
 dict=huffmandict(uniq2,res);
 compressdata=huffmanenco(y,dict);
 disp(length(compressdata)/8000)
  disp(length(compressdata)/64000)

