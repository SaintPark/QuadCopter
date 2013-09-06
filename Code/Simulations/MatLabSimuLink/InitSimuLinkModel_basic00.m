



env.gravity=9.81; % in m/s2


inp.BodyRollTorqueMag=10*0.30; % use a 10 N thrust located 30 cm from the axis of rotation as our torque input in N.m


veh.Ixx=1*0.05; % use a 1 kg mass at about 5 cm from the axis of rotation as our rot. inertia in kg.m
veh.StateToStateRates=[0,1;0,0]; % the A matrix

cont.LoopPeriod=0.01; % period of IMU loop in s
cont.StateToStateRatesDiscrete = expm(veh.StateToStateRates*cont.LoopPeriod);
cont.InputsToStatesDiscrete = [cont.LoopPeriod, cont.LoopPeriod^2/2;0, cont.LoopPeriod]*[0; veh.Ixx];

A_matrix=[0 1;0 0];
B_matrix=[0; veh.Ixx];

