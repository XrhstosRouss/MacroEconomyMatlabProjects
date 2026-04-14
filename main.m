clear;
clc;
load GDP_data.mat
years=(1995:2022)'; %ftiaxnw ton pinaka me tis xronologies
gdp_deflator= (nominal_gdp ./real_gdp)*100;
%ypologizw ton apoplithwristh se pososto

log_nominal=log(nominal_gdp); %logarithmizw on aep , real aep kai posapopl
log_real=log(real_gdp);
log_deflator=log(gdp_deflator); 

%synartisi diff mas vriskei tin diafora anamesa sta eth
Dlog_nominal=diff(log_nominal); 
Dlog_real=diff(log_real);
Dlog_deflator=diff(log_deflator);

% LHS aristeri meria eksisosis apo 5) kai deksia Dlogyt+Dlogpt
LHS = Dlog_nominal;
RHS = Dlog_real + Dlog_deflator;

% vriskei thn megisti diafora anamesa stis dyo meries
% afinoyme ena mikro perithwrio 1e-10 gia na mhn apotyxanei kathe fora 
max_diff = max(abs(LHS - RHS), [], 'all');

if max_diff < 1e-10
    disp('Η εξίσωση αληθεύει και η μεταβολή του ον.ΑΕΠ είναι ίση με την μεταβολή του πρ.ΑΕΠ + επιπέδο τιμών');
    fprintf('Η μεγαλύτερη διαφορά που δημιουργείται μαθηματικά είναι: %e\n', max_diff);
else
    disp('Η εξίσωση δεν ταυτοποιείται, υπάρχει σφάλμα');
end


%ASKISI 2
base_years = baseyearcalc(years,gdp_deflator);

fprintf('Το έτος βάσης για την Ευρώπη είναι: %d\n', base_years(1));
fprintf('Το έτος βάσης για την Ελλάδα είναι: %d\n', base_years(2));

%ASKISI 3
% Growth rate for EU
nom_EA = Dlog_nominal(:, 1) * 100;
real_EA = Dlog_real(:, 1) * 100;
def_EA = Dlog_deflator(:, 1) * 100;

% european union
plot_gdp_growth_decomposed(years, nom_EA, real_EA, def_EA, 'Euro Area');

% Growth rate for greece
nom_GR = Dlog_nominal(:, 2) * 100;
real_GR = Dlog_real(:, 2) * 100;
def_GR = Dlog_deflator(:, 2) * 100;

% greece
plot_gdp_growth_decomposed(years, nom_GR, real_GR, def_GR, 'Greece');




