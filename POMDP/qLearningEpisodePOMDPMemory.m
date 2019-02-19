function [stepsNumof, qTable] = qLearningEpisodePOMDPMemory(qTable)
    global goalState;

    % Loop until the goal state is reached
    s = rndStartState();
    memory(1) = generateObservation(s);
    memory(2) = generateObservation(s);
    stepsNumof = 1;
    while s ~= goalState
        o = generateObservation(s);
        a = qLearningSelectActionPOMDPMemory(qTable,memory);
        r = rewardMcCallum(s,a);
        ns = transitionMcCallum(s,a);
        no = generateObservation(ns);
        qTable = qTableUpdatePOMDPMemory(qTable,o,a,r,no,memory);
        stepsNumof = stepsNumof + 1;
        s = ns;
        memory(1) = o;
        memory(2) = no;
    end
end