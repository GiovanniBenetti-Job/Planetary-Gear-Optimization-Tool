% Rotismo Tipo A (Ruota 2 Bloccata, Porta-Treno Mosso)
% Imposizione valori: i = ... con tau = ...; tau0 = ...
tau = 1/3;
tau_0 = -1/2;
m = 3;  %Modulo (da scalare in base ai carichi)

%% Loop per il calcolo dei denti e satelliti
% Memoriazzazione dei risultati
% Intervallo per z1
z1_values = 10:100;

results = [];  % Array vuoto per i risultati

% Ciclo per cercare il valore corretto di z1
for z1 = z1_values
    % Calcolo z2
    z2 = -z1 / tau_0;
    
    % Calcolo zp (arrotondato per eccesso)
    zp = ceil((z2 - z1) / 2);
    
    % Verifico la condizione z1 + z2 = N * np per valori di np tra 2 e 5
    for np_candidate = 2:5
        N_candidate = (z1 + z2) / np_candidate;
        
       % Se N è intero positivo, la condizione è soddisfatta
        if mod(N_candidate, 1) == 0 && N_candidate > 0
            N = N_candidate;
            np = np_candidate;
            
            % Salvo i risultati
            results = [results; z1, zp, z2, N, np];
            break; % Esco dal ciclo np, una volta trovata la soluzione
        end
    end
end

% Stampa dei risultati
if ~isempty(results)
    % Verifica dimensione matrice dei risultati
    if size(results, 2) == 5  % Assumiamo che la matrice abbia 5 colonne
        % Ordinamento soluzioni ad z1 crescente
        results = sortrows(results, 1);  % Ordinamento per la colonna z1 (colonna 1)
        
        % Stampa dei risultati ordinati
        for i = 1:size(results, 1)
            % Assegna i valori per ogni riga di risultato
            z1 = results(i, 1);
            zp = results(i, 2);
            z2 = results(i, 3);
            N = results(i, 4);
            np = results(i, 5);
            
            % Stampa del risultato su una riga
            fprintf('z1 = %.2f, zp = %.2f, z2 = %.2f, N = %.2f, np = %d\n', z1, zp, z2, N, np);
        end
    else
        fprintf('Errore: la matrice results non ha 5 colonne.\n');
    end
else
    fprintf('Nessun risultato trovato che soddisfi la condizione.\n');
end

%% Costruzione figura
% Definizione cerchio unitario
q = linspace(0, 2*pi(), 100);
cerchio_unitario = [cos(q); sin(q)];

% Input per disegno
z1_in = 27;
zp_in = 14;
z2_in = 54;
np_in = 3;

% Definizione delle primitive
Rp01 = m / 2 * z1_in;
Rp02 = m / 2 * z2_in;
Rp0p = m / 2 * zp_in;

% Definizione dell'Interasse di taglio
I0_1p = Rp01 + Rp0p;
solare = cerchio_unitario * Rp01;
corona = cerchio_unitario * Rp02;
satellite0 = cerchio_unitario * Rp0p + [0; I0_1p];

% Posizionamento Satelliti
delta = 2 * pi() / np_in;
for k = 1:np_in
    delta_k = (k - 1)* delta;
    A = [cos(delta_k), -sin(delta_k);
        sin(delta_k), cos(delta_k)];
    satellite(:,:,k) = A *satellite0;
end

% Rappresentazione Meccanismo
figure();
hold("on");
plot(solare(1,:), solare(2,:), 'Color', 'b');
plot(corona(1,:), corona(2,:), 'Color','r');
for k = 1:np_in
    plot(satellite(1,:,k), satellite(2,:,k), 'Color', 'g');
end
grid("on");
axis equal;
hold off