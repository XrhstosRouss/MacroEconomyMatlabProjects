function plot_gdp_growth_decomposed(years, Dlog_Y, Dlog_y, Dlog_P, region_name)
    % region_name: String για τον τίτλο (π.χ. 'EA' ή 'Greece')

    % Τα έτη πρέπει να ξεκινάνε από το 2ο λόγω του diff
    t = years(2:end); 

    figure;

    % 1ο Subplot: Nominal GDP Growth
    subplot(3, 1, 1);
    plot(t, Dlog_Y, 'LineWidth', 2);
    hold on;
    yline(0, 'k--', 'LineWidth', 2); 
    grid on;
    ylabel('\textbf{(\%)}', 'Interpreter', 'latex');
    title('\textbf{Nominal GDP Growth}', 'Interpreter', 'latex');

    % 2ο Subplot: Real GDP Growth
    subplot(3, 1, 2);
    plot(t, Dlog_y, 'LineWidth', 2);
    hold on;
    yline(0, 'k--', 'LineWidth', 2); 
    grid on;
    ylabel('\textbf{(\%)}', 'Interpreter', 'latex');
    title('\textbf{Real GDP Growth}', 'Interpreter', 'latex');

    % 3ο Subplot: GDP Deflator Growth
    subplot(3, 1, 3);
    plot(t, Dlog_P, 'LineWidth', 2);
    hold on;
    yline(0, 'k--', 'LineWidth', 2); 
    grid on;
    xlabel('\textbf{Year}', 'Interpreter', 'latex');
    ylabel('\textbf{(\%)}', 'Interpreter', 'latex');
    title('\textbf{GDP Deflator Growth}', 'Interpreter', 'latex');

    % Γενικός τίτλος
    sgtitle(['\textbf{Decomposition of Nominal GDP Growth in ', region_name, '}'], 'Interpreter', 'latex');
end