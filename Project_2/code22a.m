%Ορισμός παραμέτρων σύμφωνα με την εκφώνηση
c = 2.998*10^8;
f = 10^9;
wvl = c / f;
k = 2*pi / wvl;

%Ορισμός εύρους γωνιών
phi = 0:0.001:2*pi;
theta = 0:0.001:2*pi;

%Δημιουργία των οριζόντιων και κατακόρυφων διαγραμμάτων ακτινοβολίας για
%τις δύο περιπτώσεις ρευμάτων και για τα ζητούμενα d, κάνοντας χρήση των
%κατάλληλων συναρτήσεων που ορίζονται στο τέλος του προγράμματος
figure;

subplot(1, 3, 1);
polarplot(posHor(k, wvl/4, phi));
title('λ/4');
set(gca, 'ThetaZeroLocation', 'top');

subplot(1, 3, 2);
polarplot(posHor(k, wvl/2, phi));
title('λ/2');
set(gca, 'ThetaZeroLocation', 'top');

subplot(1, 3, 3);
polarplot(posHor(k, 3*wvl/4, phi));
title('3λ/4');
set(gca, 'ThetaZeroLocation', 'top');

figure;

subplot(1, 3, 1);
polarplot(posVer(k, wvl/4, theta));
title('λ/4');
set(gca, 'ThetaZeroLocation', 'top');

subplot(1, 3, 2);
polarplot(posVer(k, wvl/2, theta));
title('λ/2');
set(gca, 'ThetaZeroLocation', 'top');

subplot(1, 3, 3);
polarplot(posVer(k, 3*wvl/4, theta));
title('3λ/4');
set(gca, 'ThetaZeroLocation', 'top');

figure;

subplot(1, 3, 1);
polarplot(altHor(k, wvl/4, phi));
title('λ/4');
set(gca, 'ThetaZeroLocation', 'top');

subplot(1, 3, 2);
polarplot(altHor(k, wvl/2, phi));
title('λ/2');
set(gca, 'ThetaZeroLocation', 'top');

subplot(1, 3, 3);
polarplot(altHor(k, 3*wvl/4, phi));
title('3λ/4');
set(gca, 'ThetaZeroLocation', 'top');

figure;

subplot(1, 3, 1);
polarplot(altVer(k, wvl/4, theta));
title('λ/4');
set(gca, 'ThetaZeroLocation', 'top');

subplot(1, 3, 2);
polarplot(altVer(k, wvl/2, theta));
title('λ/2');
set(gca, 'ThetaZeroLocation', 'top');

subplot(1, 3, 3);
polarplot(altVer(k, 3*wvl/4, theta));
title('3λ/4');
set(gca, 'ThetaZeroLocation', 'top');

%Συνάρτηση υπολογισμού του οριζόντιου διαγράμματος ακτινοβολίας, όταν όλα
%τα ρεύματα είναι +Ι = 1Α, σύμφωνα με την θεωρητική ανάλυση
function output = posHor(k, d, phi)
output = abs(cos(k*d*cos(phi)/2) + cos(k*3*d*cos(phi)/2) + ...
    cos(k*5*d*cos(phi)/2) + cos(k*7*d*cos(phi)/2));
end

%Συνάρτηση υπολογισμού του κατακόρυφου διαγράμματος ακτινοβολίας, όταν όλα
%τα ρεύματα είναι +Ι = 1Α, σύμφωνα με την θεωρητική ανάλυση
function output = posVer(k, d, theta)
output = abs(cos(pi*cos(theta)/2)./sin(theta)).*abs(cos(k*d*sin(theta)/2) + ...
    cos(k*3*d*sin(theta)/2) + cos(k*5*d*sin(theta)/2) + cos(k*7*d*sin(theta)/2));
end

%Συνάρτηση υπολογισμού του οριζόντιου διαγράμματος ακτινοβολίας, όταν τα
%ρεύματα είναι εναλλάξ, σύμφωνα με την θεωρητική ανάλυση
function output = altHor(k, d, phi)
output = abs(sin(k*d*cos(phi)/2) - sin(k*3*d*cos(phi)/2) + ...
    sin(k*5*d*cos(phi)/2) - sin(k*7*d*cos(phi)/2));
end

%Συνάρτηση υπολογισμού του κατακόρυφου διαγράμματος ακτινοβολίας, όταν τα
%ρεύματα είναι εναλλάξ, σύμφωνα με την θεωρητική ανάλυση
function output = altVer(k, d, theta)
output = abs(cos(pi*cos(theta)/2)./sin(theta)).*abs(sin(k*d*sin(theta)/2) ...
    - sin(k*3*d*sin(theta)/2) + sin(k*5*d*sin(theta)/2) - sin(k*7*d*sin(theta)/2));
end
