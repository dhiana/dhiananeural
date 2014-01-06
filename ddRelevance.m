function r = ddRelevance(net, data, mtrn)

    nDim = size(data,1);
    r = zeros(2,nDim);
    out_ref = sim(net, data);

    for i=1:nDim

        aux = data;
        aux(i,:) = mtrn(i);
        out = sim(net, aux);
        r(:,i) = mean( (out_ref-out).^2, 2);

    end

end
