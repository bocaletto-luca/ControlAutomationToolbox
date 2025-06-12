% analyze_stability.m
% Stability plots for plant G

s = tf('s');
G = 5*(s+2)/(s*(s+1)*(s+3));

figure; margin(G); title('Bode & Gain/Phase Margins');
figure; nyquist(G); title('Nyquist Plot'); grid on;
figure; rlocus(G); title('Root-Locus');
sgrid(0, -2);
