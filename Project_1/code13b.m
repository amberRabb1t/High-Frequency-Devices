f0 = 10^9;
N = 201;
f = 0:(3*f0/N):(3*f0);
b = 0.25*pi*(f/f0);
Z1 = -1i*98.45*cot(b);
Z2 = -1i*43.6*cot(b);
Z3 = (Z1*50)./(Z1+50);
Z4 = 101.6*(Z3 + 1i*101.6*tan(b))./(101.6 + 1i*Z3.*tan(b));
Z5 = (Z2.*Z4)./(Z2+Z4);
Z6 = 101.6*(Z5 + 1i*101.6*tan(b))./(101.6 + 1i*Z5.*tan(b));
Zin = (Z1.*Z6)./(Z1+Z6);
G = (Zin-50)./(Zin+50);
Gdb = 20*log10(abs(G));
SWR = (1+abs(G))./(1-abs(G));
for i=1:N+1
    if(SWR(i)>10)
        SWR(i)=10;
    end
end
plot(f,Gdb);
xlabel('Frequency (Hz)');
ylabel('Magnitude of Reflection Coefficient (dB)');
figure;
plot(f,SWR);
xlabel('Frequency (Hz)');
ylabel('Standing Wave Ratio');