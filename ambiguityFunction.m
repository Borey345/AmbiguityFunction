% ������ ��������� ����� ���������:
N = 6; % ���������� ���������
porosity = 0.5; % ���������� ���������
time = 1:200; % ������� �� �������

deltaF = -15:0.1:15; %������� �� �������

% ��� ��� �������� �����������, ����� ��������� ������� ���������������� ��
% �����-�������. ������� ����� ������������� ���������:
period = max(time)/N;
impulseTime = period*porosity;
impulse = [ones(ceil(impulseTime), 1); zeros(ceil(period-impulseTime), 1)];
signal = repmat(impulse, [1, N]);
signal = reshape(signal, 1, []);
%plot(signal)

% ��������� �������������� ��������
out = correlationIntegral(signal, deltaF);
figure

% ����� ��������
tau = -length(signal)+1:length(signal)-1;
[x, y] = meshgrid(tau, deltaF);
surf(x, y, abs(out));
shading flat;
title(sprintf('������� ���������������� ��� ����������� ����� ��������� N=%d, ���������� - %1.3f', int32(N), porosity) );
xlabel('����� �� �������');
ylabel('����� �� �������');
zlabel('��������� ������� �� ������ �������������� �������')
% plot(abs(out));