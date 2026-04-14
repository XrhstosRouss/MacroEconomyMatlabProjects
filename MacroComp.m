function MacroComp(years,logGrNom,logEUNom,GrowthLogGrNom,GrowthLogEUNom,logGrReal,logEUReal,GrowthLogGrReal,GrowthLogEUReal,logGrDef,logEUDef,GrowthLogGrDef,GrowthLogEUDef,varname)
figure(1);
sgtitle([varname ' - Nominal Analysis']);

% 1ο subplot: Log Consumption Ελλάδα
subplot(2,2,1)
plot(years, logGrNom, '-o', 'Color','b','LineWidth',1.5);
title([varname '- Greek Republic'])
xlabel('Year'); ylabel('Log Value');
grid on;

% 2ο subplot: Log Consumption EU
subplot(2,2,2)
plot(years, logEUNom, '-s', 'Color','r','LineWidth',1.5);
title([varname '- European Union'])
xlabel('Year'); ylabel('Log Value');
grid on;

% 3ο subplot: Growth rate Ελλάδα
subplot(2,2,3)
plot(years(2:end), GrowthLogGrNom, '-o', 'Color','b','LineWidth',1.5);
title([varname '- Growth Rate Greek Republic (%)']);
xlabel('Year'); ylabel('Growth Rate');
grid on;

% 4ο subplot: Growth rate EU
subplot(2,2,4)
plot(years(2:end), GrowthLogEUNom, '-s', 'Color','r','LineWidth',1.5);
title([varname '- Growth Rate EU (%)']);
xlabel('Year'); ylabel('Growth Rate');
grid on;

figure(2);
sgtitle([varname ' - Real Analysis']);

% 1ο subplot: Log Consumption Ελλάδα
subplot(2,2,1)
plot(years, logGrReal, '-o', 'Color','b','LineWidth',1.5);
title([varname '- Greek Republic'])
xlabel('Year'); ylabel('Log Value');
grid on;

% 2ο subplot: Log Consumption EU
subplot(2,2,2)
plot(years, logEUReal, '-s', 'Color','r','LineWidth',1.5);
title([varname '- European Union'])
xlabel('Year'); ylabel('Log Value');
grid on;

% 3ο subplot: Growth rate Ελλάδα
subplot(2,2,3)
plot(years(2:end), GrowthLogGrReal, '-o', 'Color','b','LineWidth',1.5);
title([varname '- Growth Rate Greek Republic (%)']);
xlabel('Year'); ylabel('Growth Rate');
grid on;

% 4ο subplot: Growth rate EU
subplot(2,2,4)
plot(years(2:end), GrowthLogEUReal, '-s', 'Color','r','LineWidth',1.5);
title([varname '- Growth Rate EU (%)']);
xlabel('Year'); ylabel('Growth Rate');
grid on;

figure(3);
sgtitle([varname ' - Deflator Analysis']);

% 1ο subplot: Log Consumption Ελλάδα
subplot(2,2,1)
plot(years, logGrDef, '-o', 'Color','b','LineWidth',1.5);
title([varname '- Greek Republic'])
xlabel('Year'); ylabel('Log Value');
grid on;

% 2ο subplot: Log Consumption EU
subplot(2,2,2)
plot(years, logEUDef, '-s', 'Color','r','LineWidth',1.5);
title([varname '- European Union'])
xlabel('Year'); ylabel('Log Value');
grid on;

% 3ο subplot: Growth rate Ελλάδα
subplot(2,2,3)
plot(years(2:end), GrowthLogGrDef, '-o', 'Color','b','LineWidth',1.5);
title([varname '- Growth Rate Greek Republic (%)']);
xlabel('Year'); ylabel('Growth Rate');
grid on;

% 4ο subplot: Growth rate EU
subplot(2,2,4)
plot(years(2:end), GrowthLogEUDef, '-s', 'Color','r','LineWidth',1.5);
title([varname '- Growth Rate EU (%)']);
xlabel('Year'); ylabel('Growth Rate');
grid on;



end