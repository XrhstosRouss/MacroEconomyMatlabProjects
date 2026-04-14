clc;
clear;

filename = 'Quarterly_Data.xlsx';

%data range
dataRange = 'FF12:OB13';

% sheet data
rawGDP  = xlsread(filename,'Sheet 40',dataRange);
rawCONS = xlsread(filename,'Sheet 42',dataRange);
rawINV  = xlsread(filename,'Sheet 51',dataRange);

% EU (row 1) , Greece (row 2)
GR_GDP  = rawGDP(2,:);
GR_CONS = rawCONS(2,:);
GR_INV  = rawINV(2,:);

% delete naan data
validIdx = ~isnan(GR_GDP);

GR_GDP  = GR_GDP(validIdx);
GR_CONS = GR_CONS(validIdx);
GR_INV  = GR_INV(validIdx);

% Time axis
time = datetime(1995,1,1):calquarters(1):datetime(2023,12,31);
time = time(1:length(GR_GDP));

% Logs
logGDP  = log(GR_GDP);
logCONS = log(GR_CONS);
logINV  = log(GR_INV);

% HP Filter
lambda = 1600;

[cycleY, trendY] = hpfilter(logGDP, smoothing=lambda);
[cycleC, trendC] = hpfilter(logCONS,smoothing= lambda);
[cycleI, trendI] = hpfilter(logINV,smoothing= lambda);

%Plot actual vs trend
figure
subplot(3,1,1)
plot(time,logGDP)
hold on
plot(time,trendY,'LineWidth',2)
title('GDP: Actual vs Trend')
legend('Actual','Trend')

subplot(3,1,2)
plot(time,logCONS)
hold on
plot(time,trendC,'LineWidth',2)
title('Consumption: Actual vs Trend')
legend('Actual','Trend')

subplot(3,1,3)
plot(time,logINV)
hold on
plot(time,trendI,'LineWidth',2)
title('Investment: Actual vs Trend')
legend('Actual','Trend')

%Cyclical components
figure
subplot(3,1,1)
plot(time,cycleY)
title('GDP Cycle')

subplot(3,1,2)
plot(time,cycleC)
title('Consumption Cycle')

subplot(3,1,3)
plot(time,cycleI)
title('Investment Cycle')

% All cycles together
figure
plot(time,cycleY)
hold on
plot(time,cycleC)
plot(time,cycleI)
legend('GDP','Consumption','Investment')
title('Cyclical Components')

questionsix(rawGDP,rawCONS,rawINV);