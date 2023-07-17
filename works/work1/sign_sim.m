clear;
clc;

fs = 5000000; % 采样率为 5MHz
N = 50000; % 采样点数为 50K

%%
% 计算两个采样点之间的时间间隔 delta_t
dt = 1/fs;
% 计算总的采样时间向量
t = 0:dt:(N-1)*dt;

%%
% 利用高斯分布（均值为 0，标准差为 1）产生随机信号
y = random('Normal', 0, 1, 1, N); % 0 为均值，1 为标准差，1 行，N 列
disp('前 10 个随机信号：')
disp(y(1:10));

% 概率密度
x = -10:0.1:10;
f = normpdf(x, 0, 1); % 0 为均值，1 为标准差
disp('前 10 个概率密度：')
disp(f(1:10));

% 自相关函数（maxlags 为滞后）
[R, maslags] = xcorr(y, 'unbiased'); % 'unbiased' 为无偏估计
disp('前 10 个自相关函数：')
disp(R(1:10));

%%
% 打印波形图
figure(1);

% 高斯分布的信号实例波形
subplot(3,1,1);
plot(t, y);
title('Wave');
xlabel('time/s');
ylabel('ampl/V');

% 概率密度
subplot(3,1,2);
plot(x, f);
title('PDF');
xlabel('ampl/V');
ylabel('P');

% 自相关
subplot(3,1,3);
plot(maslags/fs, R);
title('XCORR');
xlabel('time/s');
ylabel('R');
axis([-0.01, 0.01, -1.5, 1.5]);
