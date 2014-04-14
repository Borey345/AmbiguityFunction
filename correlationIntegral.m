function out = correlationIntegral(signal, deltaF, deltaT, nF, nTau)

porosity = 0.5;
time = 1:200;
signal = zeros(size(time));
% signal(47:53) = 1;
signal(length(signal)*porosity/2:3*length(signal)*porosity/2) = 1;
deltaF = -10:0.5:10;
% deltaT = 0.11;
nF = 6;
nTau = length(deltaF);

nT = length(signal);

doppler = bsxfun(@times, deltaF', 1:nT);
doppler = exp(2*1i*pi*doppler/nT);
signalDoppler = bsxfun(@times, signal, doppler);

out = conv2(signal, signalDoppler);

figure
surf(abs(out(:, 100:300)));
end