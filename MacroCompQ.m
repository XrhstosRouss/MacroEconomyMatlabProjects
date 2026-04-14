function MacroCompQ(years, logGrNom, logEUNom, GrowthLogGrNom, GrowthLogEUNom, ...
                   logGrReal, logEUReal, GrowthLogGrReal, GrowthLogEUReal, ...
                   logGrDef, logEUDef, GrowthLogGrDef, GrowthLogEUDef, varname)

    % COMMON SETTINGS
    lw = 1.5;         % linewidth
    fs_title = 14;    % font size for titles
    fs_axes = 12;     % font size for axes
    markerSize = 4;   % size for markers
   bgcolor = [0.15 0.15 0.15];  % light gray figure background

    % FIGURE 1: NOMINAL
    figure('Name', [varname ' - Nominal'], 'Color', bgcolor);
    sgtitle([varname ' - Nominal Analysis'], 'FontSize', 16, 'FontWeight','bold');
    
    % Logs Greece
    subplot(2,2,1)
    plot(years, logGrNom, '-o', 'Color','b', 'LineWidth',lw, 'MarkerSize',markerSize);
    grid on; title('Logs: Greece (Nominal)', 'FontSize', fs_title); 
    xlabel('Time'); ylabel('Log Value'); set(gca,'FontSize',fs_axes);

    % Logs EU
    subplot(2,2,2)
    plot(years, logEUNom, '-s', 'Color','r', 'LineWidth',lw, 'MarkerSize',markerSize);
    grid on; title('Logs: EU (Nominal)', 'FontSize', fs_title); 
    xlabel('Time'); ylabel('Log Value'); set(gca,'FontSize',fs_axes);

    % Growth Greece
    subplot(2,2,3)
    plot(years, GrowthLogGrNom, '-', 'Color','b', 'LineWidth',lw);
    grid on; title('Growth Rate Greece (%)', 'FontSize', fs_title); 
    xlabel('Time'); ylabel('Growth (%)'); set(gca,'FontSize',fs_axes);

    % Growth EU
    subplot(2,2,4)
    plot(years, GrowthLogEUNom, '-', 'Color','r', 'LineWidth',lw);
    grid on; title('Growth Rate EU (%)', 'FontSize', fs_title); 
    xlabel('Time'); ylabel('Growth (%)'); set(gca,'FontSize',fs_axes);

    % FIGURE 2: REAL
    figure('Name', [varname ' - Real'], 'Color', bgcolor);
    sgtitle([varname ' - Real Analysis'], 'FontSize',16,'FontWeight','bold');
    
    subplot(2,2,1)
    plot(years, logGrReal, '-o', 'Color','b', 'LineWidth',lw, 'MarkerSize',markerSize);
    grid on; title('Logs: Greece (Real)', 'FontSize', fs_title); xlabel('Time'); ylabel('Log Value'); set(gca,'FontSize',fs_axes);

    subplot(2,2,2)
    plot(years, logEUReal, '-s', 'Color','r', 'LineWidth',lw, 'MarkerSize',markerSize);
    grid on; title('Logs: EU (Real)', 'FontSize', fs_title); xlabel('Time'); ylabel('Log Value'); set(gca,'FontSize',fs_axes);

    subplot(2,2,3)
    plot(years, GrowthLogGrReal, '-', 'Color','b', 'LineWidth',lw);
    grid on; title('Growth Rate Greece (%)', 'FontSize', fs_title); xlabel('Time'); ylabel('Growth (%)'); set(gca,'FontSize',fs_axes);

    subplot(2,2,4)
    plot(years, GrowthLogEUReal, '-', 'Color','r', 'LineWidth',lw);
    grid on; title('Growth Rate EU (%)', 'FontSize', fs_title); xlabel('Time'); ylabel('Growth (%)'); set(gca,'FontSize',fs_axes);

    % FIGURE 3: DEFLATOR
    figure('Name', [varname ' - Deflator'], 'Color', bgcolor);
    sgtitle([varname ' - Deflator Analysis'], 'FontSize',16,'FontWeight','bold');

    subplot(2,2,1)
    plot(years, logGrDef, '-o', 'Color','b', 'LineWidth',lw, 'MarkerSize',markerSize);
    grid on; title('Logs: Greece (Deflator)', 'FontSize', fs_title); xlabel('Time'); ylabel('Log Value'); set(gca,'FontSize',fs_axes);

    subplot(2,2,2)
    plot(years, logEUDef, '-s', 'Color','r', 'LineWidth',lw, 'MarkerSize',markerSize);
    grid on; title('Logs: EU (Deflator)', 'FontSize', fs_title); xlabel('Time'); ylabel('Log Value'); set(gca,'FontSize',fs_axes);

    subplot(2,2,3)
    plot(years, GrowthLogGrDef, '-', 'Color','b', 'LineWidth',lw);
    grid on; title('Growth Rate Greece (%)', 'FontSize', fs_title); xlabel('Time'); ylabel('Growth (%)'); set(gca,'FontSize',fs_axes);

    subplot(2,2,4)
    plot(years, GrowthLogEUDef, '-', 'Color','r', 'LineWidth',lw);
    grid on; title('Growth Rate EU (%)', 'FontSize', fs_title); xlabel('Time'); ylabel('Growth (%)'); set(gca,'FontSize',fs_axes);

end