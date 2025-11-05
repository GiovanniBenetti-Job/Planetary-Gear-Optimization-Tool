% Definizione dell'intervallo per tau_0
tau_0 = linspace(-10, 10, 1000);

% Calcolo delle funzioni tau in funzione di tau_0
tau1 = 1 ./(1 - tau_0);
tau2 = 1 - tau_0;
tau3 = tau_0 ./ (tau_0 - 1);
tau4 = (tau_0 - 1) ./tau_0;

% Gestione delle discontinuità
tau1(abs(tau_0 - 1) < 0.05) = NaN;
tau3(abs(tau_0 - 1) < 0.05) = NaN;
tau4(abs(tau_0) < 0.05) = NaN;

% Definizione dei valori di tau
tau_values = [1/3, 1/7, 1/10];

% Calcolo dei valori di tau_0 per ciascuna funzione
tau0_1 = (tau_values - 1)./tau_values;
tau0_2 = 1 - tau_values;
tau0_3 = tau_values ./ (tau_values - 1);
tau0_4 = 1 ./(1 - tau_values);

% Creazione del grafico
figure;

% Tracciamento delle funzioni e limiti
hold on;
plot(tau_0, tau1, 'r', 'Linewidth', 2);  % Funzione 1 rossa
plot(tau_0, tau2, 'b', 'Linewidth', 2);  % Funzione 2 blu
plot(tau_0, tau3, 'g', 'Linewidth', 2);  % Funzione 3 verde
plot(tau_0, tau4, 'c', 'Linewidth', 2);  % Funzione 4 azzurra
yline(+1, 'k--')  % Limite a +1
yline(-1, 'k--')  % Limite a -1

% Tracciamento dei punti
plot(tau0_1, tau_values, 'ro', 'MarkerFaceColor', 'r')  % Punti Funzione 1 rossa
plot(tau0_2, tau_values, 'bo', 'MarkerFaceColor', 'b')  % Punti Funzione 2 blu
plot(tau0_3, tau_values, 'go', 'MarkerFaceColor', 'g')  % Punti Funzione 3 verde
plot(tau0_4, tau_values, 'co', 'MarkerFaceColor', 'c')  % Punti Funzione 4 azzurra

% Impostazioni del grafico
grid on;
axis([-5 5 -5 5]);
xlabel('$\tau_0$', 'Interpreter', 'latex');
ylabel('$\tau$', 'Interpreter', 'latex');
title('Grafico delle funzioni di $\tau$', 'Interpreter', 'latex');

% Legenda delle funzioni
legend({
'$\tau = \frac{1}{1-\tau_0}$', ...
'$\tau = 1 - \tau_0$', ...
'$\tau = \frac{\tau_0}{\tau_0 - 1}$', ...
'$\tau = \frac{\tau_0 - 1}{\tau_0}$', ...
}, 'Location', 'NorthEast', 'Interpreter', 'latex');

% Aggiungere i testi sopra le funzioni
text(-3.5, -1.5, '$w_1=0, w_s=out$', 'Color', 'r', 'Interpreter', 'latex', 'HorizontalAlignment', 'center');
text(-3.5, -2, '$w_1=0, w_2=out$', 'Color', 'b', 'Interpreter', 'latex', 'HorizontalAlignment', 'center'); 
text(-3.5, -2.5, '$w_2=0, w_s=out$', 'Color', 'g', 'Interpreter', 'latex', 'HorizontalAlignment', 'center'); 
text(-3.5, -3, '$w_2=0, w_1=out$', 'Color', 'c', 'Interpreter', 'latex', 'HorizontalAlignment', 'center');

% Centratura degli assi
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

hold off;