%Υπολογισμός των μηκών των κλαδωτών Α και Β συναρτήσει του λ σε περίπτωση
%ανοιχτοκυκλωμάτων (oc) και βραχυκυκλωμάτων (sc), με τα δεδομένα του 
%ερωτήματος β, χρησιμοποιώντας τις σχέσεις που αναπτύχθηκαν στο ερώτημα α.
ZL = 10 - 1i*70;
Z0 = 50;
YL = 1 / ZL;
Y0 = 1 / Z0;
bd = pi/4;
Y = real(YL);
E = imag(YL);
C = Y0*tan(bd);
D = Y*tan(bd);
K = Y0 - E*tan(bd);
M = K^2 + D^2 - Y*K - D*E - D*C;
a = (tan(bd))^2;
b = -2*K*tan(bd);
Delta = b^2 - 4*a*M;
A1 = (-b + sqrt(Delta)) / (2*a);
A2 = (-b - sqrt(Delta)) / (2*a);
lAoc = atan(A1/Y0)/(2*pi);
lAsc = acot(-A2/Y0)/(2*pi);
B1 = -(Y0*(E+A1+C)*(K-A1*tan(bd))-Y*Y0*D) / ((K-A1*tan(bd))^2+D^2);
B2 = -(Y0*(E+A2+C)*(K-A2*tan(bd))-Y*Y0*D) / ((K-A2*tan(bd))^2+D^2);
lBoc = atan(B1/Y0)/(2*pi);
lBsc = acot(-B2/Y0)/(2*pi);
disp(lAoc);
disp(lAsc);
disp(lBoc);
disp(lBsc);

%Ορισμός του εύρους συχνοτήτων, αριθμητικός προσδιορισμός του d και των
%μηκών των κλαδωτών (ξέροντάς τα συναρτήσει του λ, αντικαθιστούμε με λ=c/f
%για f=5 GHz) και εύρεση των |Γ| και SWR, και για τις δύο περιπτώσεις,
%χρησιμοποιώντας τις ίδιες θεωρητικές σχέσεις από το ερώτημα α.
f = 0:(10^3):(10^10);
c = 2.998*10^8;
bee = 2*pi*f/c;
d = c/(8*5*10^9);
bd = bee*d;
C = Y0*tan(bd);
D = Y*tan(bd);
K = Y0 - E*tan(bd);
lAoc = lAoc*(c/(5*10^9));
lAsc = lAsc*(c/(5*10^9));
lBoc = lBoc*(c/(5*10^9));
lBsc = lBsc*(c/(5*10^9));
Aoc = Y0*tan(bee*lAoc);
Asc = -Y0*cot(bee*lAsc);
Boc = Y0*tan(bee*lBoc);
Bsc = -Y0*cot(bee*lBsc);
YinO = ((Y*Y0*(K-Aoc.*tan(bd))+Y0*D.*(E+Aoc+C)) ./ ((K-Aoc.*tan(bd)).^2+D.^2)) + 1i*((Y0*(E+Aoc+C).*(K-Aoc.*tan(bd))-Y*Y0*D) ./ ((K-Aoc.*tan(bd)).^2+D.^2) + Boc);
YinS = ((Y*Y0*(K-Asc.*tan(bd))+Y0*D.*(E+Asc+C)) ./ ((K-Asc.*tan(bd)).^2+D.^2)) + 1i*((Y0*(E+Asc+C).*(K-Asc.*tan(bd))-Y*Y0*D) ./ ((K-Asc.*tan(bd)).^2+D.^2) + Bsc);
Go = (Y0 - YinO) ./ (Y0 + YinO);
Gs = (Y0 - YinS) ./ (Y0 + YinS);
SWRo = (1 + abs(Go)) ./ (1 - abs(Go));
SWRs = (1 + abs(Gs)) ./ (1 - abs(Gs));

%Οι τιμές των SWR μεγαλύτερες του 10 γίνονται ίσες με 10 ώστε να μπορεί να
%απεικονισθεί σωστά το διάγραμμα.
for i=1:length(f)
    if(SWRo(i)>10)
        SWRo(i)=10;
    end
    if(SWRs(i)>10)
        SWRs(i)=10;
    end
end

%Απεικόνιση των |Γ| και SWR συναρτήσει της συχνότητας.
plot(f, abs(Go));
hold on;
plot(f, abs(Gs));
xlabel('Frequency (Hz)');
ylabel('Magnitude of Reflection Coefficient');
figure;
plot(f, SWRo);
hold on;
plot(f, SWRs);
xlabel('Frequency (Hz)');
ylabel('Standing Wave Ratio');
