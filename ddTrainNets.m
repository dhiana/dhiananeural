function [nets trs] = ddTrainNets(net, inputs, targets)

    matlabpool('open', 2)

    % Número de tentativas para uma mesma configuração
    MAX_TRIES = 3;

    nets = {};
    trs = {};

    parfor n=1:MAX_TRIES
        [nets{n}, trs{n}] = train(net, inputs, targets);
    end

    matlabpool('close');

end
