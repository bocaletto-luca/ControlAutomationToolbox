% synthesize_controllers.m
% Generate PID, LQR and H∞ controllers for a sample plant

% Sample plant
s = tf('s');
G = 5*(s+2)/(s*(s+1)*(s+3));

% PID synthesis
C_pid = pidtune(G,'PID');
fprintf('PID: Kp=%.3f Ki=%.3f Kd=%.3f\n', C_pid.Kp, C_pid.Ki, C_pid.Kd);
figure; step(feedback(C_pid*G,1)); title('PID Closed-Loop Step Response');

% LQR synthesis
A=[0 1; -5 -4]; B=[0;1]; C=eye(2); D=0;
sys = ss(A,B,C,D);
Q=diag([100,1]); R=1;
[K,S,e] = lqr(sys,Q,R);
fprintf('LQR gain K = [%s]\n', num2str(K));
figure; step(ss(A-B*K,B,C,D)); title('LQR Step Response');

% H∞ synthesis
W1 = makeweight(10,1,0.1);
W2 = makeweight(1,10,0.01);
P = augw(G,W1,[],W2);
[Kinf,CL,gopt] = hinfsyn(P,1,1);
fprintf('H∞ optimal gamma = %.3f\n', gopt);
figure; bodemag(CL); title('H∞ Closed-Loop Bode');
