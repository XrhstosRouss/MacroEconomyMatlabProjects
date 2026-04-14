clc;
clear;

filename = 'Quarterly_Data.xlsx';
choice = menu('Choose Variable:', ...
    'Domestic product at market prices', ...
    'Final Consumption Expenditure', ...
    'Gross Capital Formation');
%create a manu for choosing the data we want to research
switch choice
    case 1
        sn = 'Sheet 40'; sr = 'Sheet 1'; sd = 'Sheet 79'; varName = 'GDP';
    case 2
        sn = 'Sheet 42'; sr = 'Sheet 3'; sd = 'Sheet 81'; varName = 'Consumption';
    case 3
        sn = 'Sheet 51'; sr = 'Sheet 11'; sd = 'Sheet 90'; varName = 'Investment';
 
end
%in every sheet our data are inside this matrix
dataRange = 'FF12:OB13';

% Nominal, Real, Deflator
rawNom = readmatrix(filename, 'Sheet', sn, 'Range', dataRange);
rawReal = readmatrix(filename, 'Sheet', sr, 'Range', dataRange);
rawDef = readmatrix(filename, 'Sheet', sd, 'Range', dataRange);

% EU (row 1) Greek Republic (row 2)
EUNom = rawNom(1,:);    GrNom = rawNom(2,:);
EUReal = rawReal(1,:);  GrReal = rawReal(2,:);
EUDef = rawDef(1,:);    GrDef = rawDef(2,:);

% get Naan Data out
validIdx = ~isnan(EUNom) & ~isnan(GrNom);

EUNom = EUNom(validIdx);
GrNom = GrNom(validIdx);
EUReal = EUReal(validIdx);
GrReal = GrReal(validIdx);
EUDef = EUDef(validIdx);
GrDef = GrDef(validIdx);

% creating a time axis 
time = datetime(1995,1,1) : calquarters(1) : datetime(2023,12,31);
nTime = length(time);

% if matrix is not long enough for plot we add naan data to the end of it
nData = length(EUNom);
if nData < nTime
    pad = nTime - nData;
    EUNom = [EUNom, nan(1,pad)];
    GrNom = [GrNom, nan(1,pad)];
    EUReal = [EUReal, nan(1,pad)];
    GrReal = [GrReal, nan(1,pad)];
    EUDef = [EUDef, nan(1,pad)];
    GrDef = [GrDef, nan(1,pad)];
end

% Logs
logGrNom = log(GrNom);
logEUNom = log(EUNom);
logGrReal = log(GrReal);
logEUReal = log(EUReal);
logGrDeflator = log(GrDef);
logEUDeflator = log(EUDef);

% Growth Rates (NaN addition to the start)
growthGrNom = [NaN, diff(logGrNom)*100];
growthEUNom = [NaN, diff(logEUNom)*100];
growthGrReal = [NaN, diff(logGrReal)*100];
growthEUReal = [NaN, diff(logEUReal)*100];
growthGrDeflator = [NaN, diff(logGrDeflator)*100];
growthEUDeflator = [NaN, diff(logEUDeflator)*100];

% function call
MacroCompQ(time, logGrNom, logEUNom, growthGrNom, growthEUNom, ...
          logGrReal, logEUReal, growthGrReal, growthEUReal, ...
          logGrDeflator, logEUDeflator, growthGrDeflator, growthEUDeflator, varName);