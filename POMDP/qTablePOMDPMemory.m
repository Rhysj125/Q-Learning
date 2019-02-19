function qTable = qTablePOMDPMemory()

    global observationPairsNumOf;
    global actionsNumOf;

    qTable = rand(observationPairsNumOf,actionsNumOf) * 0.1;
    
end
