function [r,est_tr_proposed,A]=Bounding_function(I,zeta)
[r,c,ch]=size(I);
tic;
A1=Airlight(I,3)/255;
A=max(A1);
I2=I;
I=im2double(I);
min_I=min(I,[],3);
MAX=max(min_I(:));

delta=zeta./(min_I).^0.5;
est_tr_proposed= 1./( 1 + ( MAX.*10.^(-0.05*delta) )./(A-min_I) );

tr1=min_I>=A;
tr2=min_I<A;
tr2=abs(tr2.*est_tr_proposed);
tr4=abs(est_tr_proposed.*tr1);
tr3_max=max(tr4(:));
if tr3_max==0
    tr3_max=1;
end
tr3=tr4./tr3_max;
est_tr_proposed=tr2+tr3;

se = strel('square', 3);
est_tr_proposed=imclose(est_tr_proposed, se);
est_tr_proposed=CalTransmission2(I2,est_tr_proposed,1,0.5);

r = Defog(I, est_tr_proposed, A1, 0.95); 
end
