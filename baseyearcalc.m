function base_year =baseyearcalc(years,gdp_deflator)
%vazoume ~ dioti den theloume thn timh ths mikroterhs diaforas alla
%theloume thn thesh
%pairnontas to min gdp deflator vriskoyme to nominal_gdp poy einai pio
%konta sto real gdp
[~, index] = min(abs(gdp_deflator - 100));
base_year = years(index);
end