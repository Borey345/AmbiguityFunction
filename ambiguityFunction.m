% Задаем параметры пачки импульсов:
N = 6; % количество импульсов
porosity = 0.5; % скважность импульсов
time = 1:200; % отсчеты по времени

deltaF = -15:0.1:15; %отсчеты по частоте

% Так как импульсы когерентные, можно вычислять функцию неопределенности на
% видео-частоте. Создаем пачку прямоугольных импульсов:
period = max(time)/N;
impulseTime = period*porosity;
impulse = [ones(ceil(impulseTime), 1); zeros(ceil(period-impulseTime), 1)];
signal = repmat(impulse, [1, N]);
signal = reshape(signal, 1, []);
%plot(signal)

% Вычисляем корреляционный инетграл
out = correlationIntegral(signal, deltaF);
figure

% Вывод картинки
tau = -length(signal)+1:length(signal)-1;
[x, y] = meshgrid(tau, deltaF);
surf(x, y, abs(out));
shading flat;
title(sprintf('Функция неопределенности для когерентной пачки импульсов N=%d, скважность - %1.3f', int32(N), porosity) );
xlabel('Сдвиг по времени');
ylabel('Сдвиг по частоте');
zlabel('Амплитуда сигнала на выходе согласованного фильтра')
% plot(abs(out));