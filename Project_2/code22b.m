%Ορισμός παραμέτρων σύμφωνα με την εκφώνηση
c = 2.998*10^8;
f = 10^9;
wvl = c / f;
k = 2*pi / wvl;

%Ορισμός εύρους γωνιών σε μορφή συντεταγμένων
[phi, theta] = meshgrid(0:0.045:2*pi, 0:0.045:pi);

%Δημιουργία των 3D στερεών ακτινοβολίας για τις δύο περιπτώσεις ρευμάτων
%και για τα ζητούμενα d, κάνοντας χρήση των κατάλληλων συναρτήσεων που
%ορίζονται στο τέλος του προγράμματος. Για να χρησιμοποιηθεί η συνάρτηση
%surf (η οποία ζωγραφίζει το στερεό), γίνεται μετάβαση από σφαιρικές σε
%καρτεσιανές συντεταγμένες
r = pos3D(k, wvl/4, phi, theta);
X = r.*cos(phi).*sin(theta);
Y = r.*sin(phi).*sin(theta);
Z = r.*cos(theta);
surf(X, Y, Z);
title('λ/4');

figure;

r = pos3D(k, wvl/2, phi, theta);
X = r.*cos(phi).*sin(theta);
Y = r.*sin(phi).*sin(theta);
Z = r.*cos(theta);
surf(X, Y, Z);
title('λ/2');

figure;

r = pos3D(k, 3*wvl/4, phi, theta);
X = r.*cos(phi).*sin(theta);
Y = r.*sin(phi).*sin(theta);
Z = r.*cos(theta);
surf(X, Y, Z);
title('3λ/4');

figure;

r = alt3D(k, wvl/4, phi, theta);
X = r.*cos(phi).*sin(theta);
Y = r.*sin(phi).*sin(theta);
Z = r.*cos(theta);
surf(X, Y, Z);
title('λ/4');

figure;

r = alt3D(k, wvl/2, phi, theta);
X = r.*cos(phi).*sin(theta);
Y = r.*sin(phi).*sin(theta);
Z = r.*cos(theta);
surf(X, Y, Z);
title('λ/2');

figure;

r = alt3D(k, 3*wvl/4, phi, theta);
X = r.*cos(phi).*sin(theta);
Y = r.*sin(phi).*sin(theta);
Z = r.*cos(theta);
surf(X, Y, Z);
title('3λ/4');

%Συνάρτηση υπολογισμού του στερεού ακτινοβολίας, όταν όλα τα ρεύματα είναι
%+Ι = 1Α, σύμφωνα με την θεωρητική ανάλυση
function output = pos3D(k, d, phi, theta)
output = abs(cos(pi*cos(theta)/2)./sin(theta)).*abs(cos(k*d*cos(phi).*sin(theta)/2) + ...
    cos(k*3*d*cos(phi).*sin(theta)/2) + cos(k*5*d*cos(phi).*sin(theta)/2) + cos(k*7*d*cos(phi).*sin(theta)/2));
end

%Συνάρτηση υπολογισμού του στερεού ακτινοβολίας, όταν τα ρεύματα είναι
%εναλλάξ, σύμφωνα με την θεωρητική ανάλυση
function output = alt3D(k, d, phi, theta)
output = abs(cos(pi*cos(theta)/2)./sin(theta)).*abs(sin(k*d*cos(phi).*sin(theta)/2) ...
    - sin(k*3*d*cos(phi).*sin(theta)/2) + sin(k*5*d*cos(phi).*sin(theta)/2) - sin(k*7*d*cos(phi).*sin(theta)/2));
end
