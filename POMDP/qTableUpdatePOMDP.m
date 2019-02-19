function qTable = qTableUpdatePOMDP(qTable,observation,action,reward,nextObservation)
    global discountRate;
    global learningRate

    oRow = observationRow(observation);
    noRow = observationRow(nextObservation);

    nextActionMax = qTableMaxAction(qTable, noRow);
    qValDiff = reward+discountRate*qTable(noRow,nextActionMax)-qTable(oRow,action);
    qTable(oRow,action) = qTable(oRow,action)+learningRate*qValDiff;
end