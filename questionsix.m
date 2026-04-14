function questionsix(rawGDP,rawCONS,rawINV)
%same code as before
% EU (row 1) , Greece (row 2)
GR_GDP  = rawGDP(2,:);
GR_CONS = rawCONS(2,:);
GR_INV  = rawINV(2,:);


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

% 4. Volatility
volY = std(cycleY);
volC = std(cycleC);
volI = std(cycleI);
fprintf('GDP Volatility: %f\n', volY)
fprintf('Consumption Volatility: %f\n', volC)
fprintf('Investment Volatility: %f\n\n', volI)

% 5. Relative Volatility
relVolC = volC/volY;
relVolI = volI/volY;
fprintf('GDP Relative Volatility: %f\n', 1)
fprintf('Consumption Relative Volatility: %f\n', relVolC)
fprintf('Investment Relative Volatility: %f\n\n', relVolI)

Variables = {'GDP'; 'Consumption'; 'Investment'};
Volatility = [volY; volC; volI];
RelativeVolatility = [1; relVolC; relVolI];

Results = table(Variables, Volatility, RelativeVolatility, ...
                'VariableNames', {'VarNames','Volatility','RelativeVolatility'});
end