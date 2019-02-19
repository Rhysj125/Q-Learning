function [stepsNumof, qTable] = qLearningEpisodePOMDP(qTable)
    global goalState;

    % Loop until the goal state is reached
    s = rndStartState();
    stepsNumof = 1;
    while s ~= goalState
        o = generateObservation(s);
        a = qLearningSelectActionPOMDP(qTable,o);
        r = rewardMcCallum(s,a);
        ns = transitionMcCallum(s,a);
        no = generateObservation(ns);
        qTable = qTableUpdatePOMDP(qTable,o,a,r,no);
        stepsNumof = stepsNumof + 1;
        s = ns;
    end
end

