function [stepsNumof, qTable] = qLearningEpisode(qTable)
    global goalState;

    % Loop until the goal state is reached
    s = rndStartState();
    stepsNumof = 1;
    while s ~= goalState
        a = qLearningSelectAction(qTable,s);
        r = rewardMcCallum(s,a);
        ns = transitionMcCallum(s,a);
        qTable = qTableUpdate(qTable,s,a,r,ns);
        stepsNumof = stepsNumof + 1;
        s = ns;
    end
end

