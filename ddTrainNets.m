function [nets trs] = ddTrainNets(net)

    % Número de tentativas para uma mesma configuração
    MAX_TRIES = 3;

    nets = {};
    trs = {};

    for n=1:MAX_TRIES
        [nets{n}, trs{n}] = ddTrain(net);
    end

end
