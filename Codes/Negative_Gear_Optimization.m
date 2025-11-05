%% Bloccaggio Ruota 2, Rotismo Negativo, Porta-Treno Mosso
omega1 = 'IN';        % ω₁ = IN
omega2 = '0';       % ω₂ = 0
omegaS = 'OUT';      % ωₛ = OUT

% Input iniziali
tau0 = -0.5;          % Valore per τ₀
C_OUT = 32;           % Valore per C_OUT
i = 1.3;            % Incremento di coppia
C_OUTR = C_OUT * i;     % Valore reale di C_OUT

% Intervalli per eta0 e eta2s
eta0_vals = linspace(0, 1, 20);  % eta0 da 0 a 1
eta1s_vals = zeros(size(eta0_vals));  %  etas2 da 0 a 1

% Calcoli per ogni valore di eta0
for k = 1:length(eta0_vals)
    eta0 = eta0_vals(k);
    eta1s = (eta0 - tau0) / (1 - tau0);
    eta1s_vals(k) = eta1s;
end

% Trova il punto specifico (eta0 = 0.95)
eta0_specific = 0.95;
eta1s_specific = (eta0_specific - tau0) / (1 - tau0);

% Calcolo coppia d'igresso
tau = tau0 / (1 - tau0);
C_IN = C_OUTR * tau * eta1s_specific;
disp(C_IN)

% Creazione del grafico
figure;
plot(eta0_vals, eta1s_vals, 'b-', 'LineWidth', 2);  % Funzione di eta2s in blu
hold on;
plot(eta0_specific, eta1s_specific, 'ro', 'MarkerFaceColor', 'r');  % Punto specifico in rosso
grid on;
xlabel('\eta_0');
ylabel('\eta_{1s}');
legend({['\eta_{1s} per \tau_0 = ' num2str(tau0)], ...
        ['\eta_0 = ' num2str(eta0_specific) ', \eta_{1s} = ' num2str(eta1s_specific) '']}, ...
       'Location', 'Best');
hold off;