p = [0.166576061407803,0.078182664467846,0.101020692010137,0.099445435757259,0.096266427012335,0.057326626959938];
normf = (0.01:0.01:2);
plot(normf,magG(p));
xlabel('Normalized Frequency');
ylabel('Magnitude of Reflection Coefficient');
function Gin = magG(p)
normf = (0.01:0.01:2);
ZL = 120 - 1i*80;
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