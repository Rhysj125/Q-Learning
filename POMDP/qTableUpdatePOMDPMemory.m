function qTable = qTableUpdatePOMDPMemory(qTable,observation,action,reward,nextObservation, memory)
    global discountRate;
    global learningRate

    oldMemoryRow = memoryRow(memory(1), memory(2));
    newMemoryRow = memoryRow(observation, nextObservation);

    nextActionMax = qTableMaxAction(qTable, newMemoryRow);
    qValDiff = reward+discountRate*qTable(newMemoryRow,nextActionMax)-qTable(oldMemoryRow,action);
    qTable(oldMemoryRow,action) = qTable(oldMemoryRow,action)+learningRate*qValDiff;
end

