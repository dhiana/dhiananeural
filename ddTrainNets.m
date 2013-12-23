function [nets trs] = ddTrainNets(net, inputs, targets)

    % Número de tentativas para uma mesma configuração
    MAX_TRIES = 3;

    nets = {};
    trs = {};

    for n=1:MAX_TRIES
        [nets{n}, trs{n}] = train(net, inputs, targets);
    end

end
