function returnS = modelSelectState(transitionModel)
    
    s = 0;
    returnS = 0;
    while returnS == 0
        s = randi([1 11]);        
        for i = 1:4
            if (transitionModel(s,i) ~= 0)
                returnS = s;
                break
            else
                returnS = 0;
            end
        end
    end
end

