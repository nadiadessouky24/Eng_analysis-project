function [ea] = projectanalysiserror (uno,dos)
% This function is to calculate the approximate error. dos is the current
% value and uno is the previous value. 
ea=abs((dos-uno)./dos)*100;