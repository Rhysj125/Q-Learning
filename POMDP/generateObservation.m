function observation = generateObservation(s)

    global actionsNumOf;
    observation = 0;
    
    for a = 1:actionsNumOf
        if (transitionMcCallum(s,a) == s)
            observation = observation + 2^(a-1);
        end
    end
end

