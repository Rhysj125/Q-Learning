function state = rndStartState()
% Returns any state bar the goal state
    global statesNumOf;
    global goalState;
    
    state = randi(statesNumOf);
    while state == goalState
        state = randi(statesNumOf);
    end
end
