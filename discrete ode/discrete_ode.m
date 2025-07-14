clc
clear
close all

% 参数设置
g = 9.81;       % 重力加速度
L = 1.0;        % 摆长
dt = 0.05;      % 时间步长
t_max = 10;     % 模拟时间
n_steps = round(t_max / dt);  % 总步数

% 初始化数组（MATLAB索引从1开始）
theta_forward = zeros(1, n_steps);
omega_forward = zeros(1, n_steps);
theta_backward = zeros(1, n_steps);
omega_backward = zeros(1, n_steps);
t = linspace(0, t_max, n_steps);

% 初始条件
theta_forward(1) = 0.1;   % 初始角度（弧度）
omega_forward(1) = 0.0;   % 初始角速度
theta_backward(1) = 0.1;
omega_backward(1) = 0.0;

%% 前向欧拉法（显式）
for n = 2:n_steps
    omega_forward(n) = omega_forward(n-1) - dt * g/L * sin(theta_forward(n-1));
    theta_forward(n) = theta_forward(n-1) + dt * omega_forward(n-1);
end

%% 后向欧拉法（隐式）
for n = 2:n_steps
    % 迭代求解隐式方程（固定点迭代）
    theta_new = theta_backward(n-1);
    for iter = 1:10  % 迭代10次
        theta_new = theta_backward(n-1) + dt * (omega_backward(n-1) - dt * g/L * sin(theta_new));
    end
    omega_backward(n) = omega_backward(n-1) - dt * g/L * sin(theta_new);
    theta_backward(n) = theta_backward(n-1) + dt * omega_backward(n);
end

%% 计算能量（动能+势能）
energy_forward = 0.5 * L^2 * omega_forward.^2 + g * L * (1 - cos(theta_forward));
energy_backward = 0.5 * L^2 * omega_backward.^2 + g * L * (1 - cos(theta_backward));


%% 绘制结果
figure('Position', [100 100 800 600])

% 角度对比
subplot(3,1,1)
plot(t, theta_forward, 'b', t, theta_backward, 'r')
xlabel('Time (s)')
ylabel('\theta (rad)')
title('Pendulum Angle Comparison')
grid on
legend('Forward Euler', 'Backward Euler', 'Location', 'northeast')

% 角速度对比
subplot(3,1,2)
plot(t, omega_forward, 'b', t, omega_backward, 'r')
xlabel('Time (s)')
ylabel('\omega (rad/s)')
title('Angular Velocity Comparison')
grid on
legend('Forward Euler', 'Backward Euler', 'Location', 'northeast')

% 能量对比
subplot(3,1,3)
plot(t, energy_forward, 'b', t, energy_backward, 'r')
xlabel('Time (s)')
ylabel('Energy (J)')
title('Energy Conservation Comparison')
grid on
legend('Forward Euler', 'Backward Euler', 'Location', 'northeast')

% 调整子图间距
set(gcf, 'Position', get(gcf, 'Position').*[1 1 1.2 1.2])
