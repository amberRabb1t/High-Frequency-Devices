p = [0.180473320054714,0.063969451749361,0.122234659740623,0.483172442252668,0.131859623529260,0.073987057043652];
normf = (0.01:0.01:2);
plot(normf,magG(p));
xlabel('Normalized Frequency');
ylabel('Magnitude of Reflection coefficient');
function Gin = magG(p)
ZL = 120 - 1i*80;
normf = (0.01:0.01:2);
b = 2*pi*normf;
Z1 = 50*(ZL + 1i*50*tan(b*p(1)))./(50 + 1i*ZL*tan(b*p(1)));
Z11 = -1i*50*cot(b*p(4));
Ze = (Z1.*Z11)./(Z1 + Z11);
Z2 = 50*(Ze + 1i*50*tan(b*p(2)))./(50 + 1i*Ze.*tan(b*p(2)));
Z22 = -1i*50*cot(b*p(5));
Zm = (Z2.*Z22)./(Z2 + Z22);
Z3 = 50*(Zm + 1i*50*tan(b*p(3)))./(50 + 1i*Zm.*tan(b*p(3)));
Z33 = -1i*50*cot(b*p(6));
Zin = (Z3.*Z33)./(Z3 + Z33);
Gin = abs((Zin - 50)./(Zin + 50));
end