function row = memoryRow(o, no)

    if (o == 14 && no == 14)
        row = 1;
    elseif (o == 14 && no == 10)
        row = 2;
    elseif(o==10&&no==10)
        row = 3;
    elseif(o==10&&no==1)
        row = 4;
    elseif(o==10&&no==9)
        row = 5;
    elseif(o==10&&no==14)
        row = 6;
    elseif(o==10&&no==3)
        row = 7;
    elseif(o==1&&no==10)
        row = 8;
    elseif(o==1&&no==5)
        row = 9;
    elseif(o==1&&no==1)
        row = 10;
    elseif(o==5&&no==1)
        row = 11;
    elseif(o==5&&no==3)
        row = 12;
    elseif(o==5&&no==5)
    	row = 13;
    elseif(o==5&&no==9)
        row = 14;
    elseif(o==3&&no==10)
        row = 15;
    elseif(o==3&&no==5)
        row = 16;
    elseif(o==3&&no==3)
        row = 17;
    elseif(o==9&&no==5)
        row = 18;
    elseif(o==9&&no==10)
        row = 19;
    elseif(o==9&&no==9)
        row = 20;
    end
end

