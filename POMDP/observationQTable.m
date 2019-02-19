function qTable = observationQTable()

    global observationNumOf;
    global actionsNumOf;
    global goalState;

    qTable = rand(observationNumOf,actionsNumOf) * 0.1;
    qTable(goalState, :) = zeros(1, actionsNumOf);
    
end