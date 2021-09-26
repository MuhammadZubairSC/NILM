%Author:Muhammad Zubair SC
%Title: NILM
%% Extracting the data for CT, VT and Time
% Also check pwelch function and suggest that it is more better than fft
function Feature_data=featuresExtractor(Stringnum,joe)

[token,remain] = strtok(Stringnum);
a=replace(token,","," ");
[Strvt,b]=strtok(a,' ');
[Strct,strtt]=strtok(b,' ');
Vt_data=str2double(Strvt);
Ct_data=str2double(Strct);
Time_data=str2double(strtt);
Power=Vt_data(1026:end,:)';
Irms=Ct_data(1026:end,:)';
powerFactor=Time_data(1026:end,:)';
Ct_data=Ct_data(1:1024,:)';
Vt_data=Vt_data(1:1024,:)';
Time_data=Time_data(1:1024,:)';

avgPower=(sum(Power')/4)';
avgIrms=(sum(Irms')/4)';
avgPFactor=(sum(powerFactor')/4)';

%% FFT
xD=Vt_data(1,:);
nfft = 2^nextpow2(length(xD));
xFreqC=zeros(joe,nfft);
fs=1/((Time_data(1,end)-Time_data(1,end-1))*10^(-6));
faxis1 = (0:511)/512*fs/2;
his_feature=zeros(joe,1);
pks=zeros(joe,8);



Vt_data(isnan(Vt_data))=0;
Ct_data(isnan(Ct_data))=0;
for k=1:joe
xFreqC(k,:) = abs(fft(Ct_data(k,:), nfft));

Arrangement=sort(xFreqC(k,2:nfft/2),'descend');
pks(k,:)=Arrangement(1:8);
[f,x]=hist(Ct_data(k,:),50);
his_feature(k,:)=max(normpdf(x,mean(x),std(x)));

end

Feature_data=[avgPower avgPFactor pks his_feature];
