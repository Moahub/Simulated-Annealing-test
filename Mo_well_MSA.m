%Mo_well_MSA code is a trial for using Metropolis Simulated Annealing algorithm
%
%
%
%
clc;
clear
close all;

x=(1:0.1:4)';

y= zeros(length(x),1);
for i = 1:length(x)

y(i)= (sin(x(i)) + sin((10.0 / 3.0) * x(i)))+5; %minimum value is -1.4748
end
ymin=min(y);
v=find(y==ymin);

figure
plot (x,y)
hold on
plot(x(v),y,'.:r')

%%
%%============================= CONSTANTS ===============================%%
Ti = 1;                             % initial Temperature
g  = 0.9;                                 % Annealing rate
% Tc = 0.000001;                               % Critical Temperature
% d0 = 1e-10;                                % tolerance threshold
Ni=50;                                    % iterations Number
count=0;                                      % counter
maxiter = 100;                            % Maximum Iterations
ri = rand(1,1);
x1 = min(x) + ri*(max(x)-min(x));
y1 = (sin(x1) + sin((10.0 / 3.0) * x1))+5;
T=Ti;
%%
%%================================ MSA ==================================%%
for j=1:maxiter    
    for n= 1:Ni
            
            
            ri = rand(1,1);
            x2 = min(x) + ri*(max(x)-min(x));
            y2 = (sin(x2) + sin((10.0 / 3.0) * x2))+5;
            d1 = y1-ymin;
            d2 = y2-ymin;

            delta_E= d2-d1;
            
            if delta_E <=0
                x1=x2;
                d1=d2;
                y1=y2;
            elseif delta_E >0
                p=exp(-delta_E/T);
                alpha = rand(1,1);
                if (p> alpha)
                    x1=x2;
                    d1=d2;
                    y1=y2;
                else
                    x1=x1;
                    d1=d1;
                    y1=y1;
                end                            
            end                      
    end
    T=T*g;  % Annealing
    count=count+1;
      figure(2)
    plot(x,y)
    hold on
    plot(x1,y1,'*r')
    hold off
end

    figure(2)
    plot(x,y)
    hold on
    plot(x1,y1,'*r')
    hold off