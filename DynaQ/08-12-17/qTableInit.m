function q = qTableInit()
    global statesNumOf;
    global actionsNumOf;
    global goalState;
    
    q = rand(statesNumOf,actionsNumOf)*0.1;
    q(goalState,:) = zeros(1,actionsNumOf);
end
