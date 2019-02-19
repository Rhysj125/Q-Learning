function a = modelSelectAction(transitionModel, s)
    row = transitionModel(s,:);
    a = 0;
    while a == 0
        a = randi([1 4]);
        if(row(a) == 0)
            a = 0;
        end
    end
end