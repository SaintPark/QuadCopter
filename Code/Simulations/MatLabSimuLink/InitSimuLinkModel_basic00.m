clear all
close all
clc


% Earth's gravitational acceleration near the surface (in m/s2)
env.gravity=9.81; 

% For testing, use a 40 N (approx 4kg) thrust located 25 cm (approx 10in) from the axis of rotation as our torque input in N.m
inp.BodyRollTorqueMag=40*0.25; 

% Assume the roll gyro sensor has a bias of 0.05 m/s2
sen.gx.bias=0.05;

% For testing, use a 1kg mass at about 5cm (approx 2in) from the axis of rotation as our rot. inertia in kg.m
veh.Ixx=1*0.05; 

% The state transition matrix, state to state rates, or the A matrix in continuous time
veh.StateToStateRates=[0,1;0,0]; 
A_matrix=veh.StateToStateRates;

% The inputs to state rates matrix, or the B matrix in continuous time
B_matrix=[0; veh.Ixx];

% The process noise covariance matrix, or Q matrix
Q_matrix=[0.01 0; 0 0.01];

% The measurement noise covariance matrix, or the R matrix
R_matrix=[0.1 0 0; 0 0.1 0; 0 0 .001];

% The period of the IMU loop in s
cont.LoopPeriod=0.01; 

% The state transition matrix, state to state rates, or the A matrix in discrete time, as used in the controller
cont.StateToStateRatesDiscrete = expm(veh.StateToStateRates*cont.LoopPeriod);
Ad_matrix=cont.StateToStateRatesDiscrete;

% To convert the continuous B_matrix to discrete,int(mexp(A*tau)dtau,0,T)*B
% where tau is integration variable, T is time step, A is the state
% transition matrix (A_matrix above) and B is the B_matrix
% mexp(A*tau) = [1 tau; 0 1]. Integrating wrt tau gives [tau tau^2/2; 0 tau]
% evaluating from 0 to T gives [T T^2/2; 0 T], and then just post multiply
% by the continuous B_matrix
cont.InputsToStatesDiscrete = [cont.LoopPeriod, cont.LoopPeriod^2/2;0, cont.LoopPeriod]*[0; veh.Ixx];


