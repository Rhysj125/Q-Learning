function action = qLearningSelectActionPOMDPMemory(qTable,memory)
    global actionsNumOf;
    global explorationRate;
    
    row = memoryRow(memory(1), memory(2));
    
    if rand() < explorationRate
        action = randi(actionsNumOf);
        %fprintf('Exploration action %d\n',action);
    else
        action = qTableMaxAction(qTable,row);
        %fprintf('Exploitation action %d\n',action);
    end
end
