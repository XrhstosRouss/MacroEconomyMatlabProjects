clc;
clear;

filename = 'Annual_Data.xlsx';

% menu 
choice = menu('Choose Variable:', ...
    'Final Consumption Expenditure', ...
    'Government Consumption', ...
    'Household Consumption', ...
    'Gross Fixed Capital Formation', ...
    'Exports', ...
    'Imports');

% choosing the right data 
switch choice
    case 1
        sheetNominal = 'Sheet 42';
        sheetReal = 'Sheet 81';
        sheetDeflator ='Sheet 120';
        range = 'AP11:CR12';
        varName = 'Final Consumption Expenditure';
        
    case 2
        sheetNominal = 'Sheet 43';
        sheetReal ='Sheet 82';
        sheetDeflator = 'Sheet 121';
        range = 'AP11:CR12';
        varName = 'Government Consumption';
        
    case 3
        sheetNominal = 'Sheet 47';
        sheetReal ='Sheet 86';
        sheetDeflator = 'Sheet 125';
        range = 'AP11:CR12';
        varName = 'Household Consumption';
        
    case 4
        sheetNominal = 'Sheet 51';
        sheetReal ='Sheet 90';
        sheetDeflator = 'Sheet 129';
        range = 'AP11:CR12';
        varName = 'Gross Fixed Capital Formation';
        
    case 5
        sheetNominal = 'Sheet 55';
        sheetReal ='Sheet 94';
        sheetDeflator = 'Sheet 133';
        range = 'AP11:CR12';
        varName = 'Exports';
        
    case 6
        sheetNominal = 'Sheet 58';
        sheetReal ='Sheet 97';
        sheetDeflator = 'Sheet 136';
        range = 'AP11:CR12';
        varName = 'Imports';
       
end

dataNominal = readmatrix(filename, 'Sheet', sheetNominal, 'Range', range);
% column vectors
EUNom = dataNominal(1, :)';        % European Union (serie 11)
GreeceNom = dataNominal(2, :)';    % Greek Republic (serie 12)

EUNom = EUNom(~isnan(EUNom));
GreeceNom = GreeceNom(~isnan(GreeceNom)); %removing Nan

dataReal = readmatrix(filename, 'Sheet',sheetReal,'Range', range);

EUReal = dataReal(1, :)';        
GreeceReal = dataReal(2, :)';    

EUReal = EUReal(~isnan(EUReal));
GreeceReal = GreeceReal(~isnan(GreeceReal));

dataDeflator = readmatrix(filename, 'Sheet',sheetDeflator,'Range', range);

EUdeflator = dataDeflator(1, :)';        
Greecedeflator = dataDeflator(2, :)';    

EUdeflator = EUdeflator(~isnan(EUdeflator));
Greecedeflator = Greecedeflator(~isnan(Greecedeflator));

years=(1995:2022)'; %year in serie

logGrNom=log(GreeceNom);
logEUNom=log(EUNom);

GrowthLogGrNom=diff(logGrNom)*100;
GrowthLogEUNom=diff(logEUNom)*100;

logGrReal=log(GreeceReal);
logEUReal=log(EUReal);

GrowthLogGrReal=diff(logGrReal)*100;
GrowthLogEUReal=diff(logEUReal)*100;

logGrDef=log(Greecedeflator);
logEUDef=log(EUdeflator);

GrowthLogGrDef=diff(logGrDef)*100;
GrowthLogEUDef=diff(logEUDef)*100;

LHSGr=GrowthLogGrNom;
RHSGr= GrowthLogGrReal + GrowthLogGrDef;

LHSEU=GrowthLogEUNom;
RHSEU=GrowthLogEUReal+GrowthLogEUDef;

max_diff = max(abs(LHSGr - RHSGr), [], 'all');

if max_diff < 1e-3 %false statement gap
    disp('Η εξίσωση αληθεύει για την Ελλάδα και η μεταβολή του ον.ΑΕΠ είναι ίση με την μεταβολή του πρ.ΑΕΠ + επιπέδο τιμών');
    fprintf('Η μεγαλύτερη διαφορά που δημιουργείται μαθηματικά είναι: %e\n', max_diff);
else
    disp('Η εξίσωση δεν ταυτοποιείται για Ελλάδα');
end

max_diff = max(abs(LHSEU - RHSEU), [], 'all');

if max_diff < 1e-3
    disp('Η εξίσωση αληθεύει για ΕΕ και η μεταβολή του ον.ΑΕΠ είναι ίση με την μεταβολή του πρ.ΑΕΠ + επιπέδο τιμών');
    fprintf('Η μεγαλύτερη διαφορά που δημιουργείται μαθηματικά είναι: %e\n', max_diff);
else
    disp('Η εξίσωση δεν ταυτοποιείται για Ευρωπαική Ένωση');
end

base_yearex4(years,EUdeflator,Greecedeflator);


MacroComp(years,logGrNom,logEUNom,GrowthLogGrNom,GrowthLogEUNom,logGrReal,logEUReal,GrowthLogGrReal,GrowthLogEUReal,logGrDef,logEUDef,GrowthLogGrDef,GrowthLogEUDef,varName)