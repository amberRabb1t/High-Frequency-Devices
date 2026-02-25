%Ορισμός παραμέτρων σύμφωνα με την εκφώνηση
c = 2.998*10^8;
f = 10^9;
wvl = c / f;
k = 2*pi / wvl;

%Ορισμός μεταβλητών όπου θα αποθηκευτούν τα αθροίσματα Riemann
Rsum1 = 0;
Rsum2 = 0;

%Λούπα που υλοποιεί με διπλό άθροισμα Riemann το διπλό ολοκλήρωμα της
%θεωρητικής ανάλυσης. Το βήμα είναι μισή μοίρα και το θ αναγκαστικά δεν
%ξεκινάει από το 0, ώστε να αποφευχθεί απροσδιοριστία. Για το Rsum1
%(ευρύπλευρη λειτουργία) χρησιμοποιείται d=3λ/4 και η συνάρτηση |Ε| για +Ι
%ρεύματα, ενώ για το Rsum2 (ακροπυροδοτική λειτουργία) χρησιμοποιείται 
%d=λ/2 και η συνάρτηση |Ε| για εναλλάξ ρεύματα, όπως αποφασίσαμε στο
%ερώτημα (γ)
for phi = 0:pi/360:2*pi
    for theta = 0.00000001:pi/360:pi
        Rsum1 = Rsum1 + (Espos(k, 3*wvl/4, phi, theta)^2)*sin(theta)*(pi/360)^2;
        Rsum2 = Rsum2 + (Esalt(k, wvl/2, phi, theta)^2)*sin(theta)*(pi/360)^2;
    end
end

%Εφαρμογή του τύπου που βρήκαμε στην θεωρητική ανάλυση
D1 = 64*pi/Rsum1;
D2 = 64*pi/Rsum2;

disp(D1);
disp(D2);

%Συνάρτηση υπολογισμού του μέτρου του Ε (χωρίς Ε0), όταν όλα τα ρεύματα
%είναι +Ι = 1Α, σύμφωνα με την θεωρητική ανάλυση
function output = Espos(k, d, phi, theta)
output = abs(cos(pi*cos(theta)/2)./sin(theta)).*abs(cos(k*d*cos(phi).*sin(theta)/2) + ...
    cos(k*3*d*cos(phi).*sin(theta)/2) + cos(k*5*d*cos(phi).*sin(theta)/2) + cos(k*7*d*cos(phi).*sin(theta)/2));
end

%Συνάρτηση υπολογισμού του μέτρου του Ε (χωρίς Ε0), όταν τα ρεύματα είναι
%εναλλάξ, σύμφωνα με την θεωρητική ανάλυση
function output = Esalt(k, d, phi, theta)
output = abs(cos(pi*cos(theta)/2)./sin(theta)).*abs(sin(k*d*cos(phi).*sin(theta)/2) ...
    - sin(k*3*d*cos(phi).*sin(theta)/2) + sin(k*5*d*cos(phi).*sin(theta)/2) - sin(k*7*d*cos(phi).*sin(theta)/2));
end
