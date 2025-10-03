clear;
clc;
rpm_to_rad_s = 2*pi/60; % [rad/s]/[rpm]
km_h_to_m_s = 1000/3600; %[m/s]/][km/h]

% General Informations
v_line = 600; % [V]
rated_power = 21; % [kW]
number_motors = 4;% [1]
rated_speed = 970; % [rpm]
rated_speed_rad_s = rated_speed*rpm_to_rad_s; % [rad/s]
overall_rated_current = 156; % [A]
K_s = 1.06; % [Nm/A^2]

% Armature circuit
R_a = 0.39;  % [Ohms]
tau_a = 10E-03; % [s]
L_a = R_a*tau_a; % [H]

% Excitation Circuit
rated_v_excitation = 60; % [V]
rated_i_excitation = 5; % [A]
R_e = 12; % [Ohms]
tau_e = 0.1; % [s]
L_e = R_e*tau_e; % [H]

% Tramway information
v_max = 42; % [km/h]
v_max_m_s = v_max*1000/3600; % [m/s]
a_max = v_max_m_s/25; % [m/s^2]
m_Tram = 15*1000; % [kg]
m_Trainload = 130*80; % [kg]
m_Total = m_Tram + m_Trainload; % [kg]
beta = 0.81; % [Nms]
rho = 13/74; % [1]
wheel_d = 680e-3;   % [m]
J_eq = m_Total*(rho^2)*(wheel_d^2)/4;

w_max = v_max_m_s/(rho*(wheel_d/2)) %[rad/s]
w_dot_max = w_max/25 %[rad/s^2]

% Rated Current
rated_i_armature = rated_power*1000/v_line;
E_n = v_line-R_a*rated_i_armature;

% Nominal Electromotive Force

%E_n = 4*rated_power*1000/156

E_n = K_s*rated_i_excitation*rated_speed_rad_s

% Speed Profile variable
v_r_tram_m_s = rated_speed_rad_s*rho*wheel_d/2;
v_r_tram = v_r_tram_m_s/km_h_to_m_s;

% Armature Current Regulator
Kp_a=0.156; %0.14177
Ki_a=15.6; %18.272

% Excitation Current Regulator
Kp_e=36; %41.805
Ki_e=360; %520.74

% Armature Current Regulator
Kp_ome=100; %91
Ki_ome=5; %7