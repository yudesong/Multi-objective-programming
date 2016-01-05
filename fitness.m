function fitness(pop_size,vesselNum,berthNum)
global pop;
global popfit;
popfit = zeros(1,pop_size);
load vessel.txt
a = 1;
while a<=pop_size
    chromosome = pop(a,:);
    vesselInfo = zeros(vesselNum+berthNum-1,6);
    i = 1;
    while i<=length(chromosome)
        vesselInfo(i,1) = chromosome(i);
        i = i+1;
    end;
    matrix = vessel(1:vesselNum,1:4);
    i = 1;
    j = 1;
    berthNo = 1;
    q = 4;
    while i <= length(chromosome)
        vesselNo = vesselInfo(i,1);
        if vesselNo == 0
            j=0;
            berthNo = berthNo+1;
        else
            m = find(matrix(:,1)==vesselNo);
            arriveTime = matrix(m,2);
            grossWeight = matrix(m,3);
            grossType = matrix(m,4);
            minWeight = min(matrix(:,3));
            maxWeight = max(matrix(:,3));
            p = (q*grossWeight-minWeight)/(maxWeight-minWeight);
            loadTime = panLoadTime(grossType,grossWeight,berthNo);
            if j==1
                vesselInfo(i,2) = 0;
                vesselInfo(i,3) = arriveTime - 0;
                vesselInfo(i,4) = arriveTime+loadTime;
                vesselInfo(i,5) = loadTime;
                vesselInfo(i,6) = vesselInfo(i,5)*p;
            else
                if arriveTime < vesselInfo(i-1,4)
                    vesselInfo(i,2) = vesselInfo(i-1,4)-arriveTime;
                    vesselInfo(i,3) = 0;
                    vesselInfo(i,4) = vesselInfo(i-1,4)+loadTime;
                    vesselInfo(i,5) = vesselInfo(i,2)+loadTime;
                    vesselInfo(i,6) = vesselInfo(i,5)*p;
                else
                    vesselInfo(i,2) = 0;
                    vesselInfo(i,3) = arriveTime - vesselInfo(i-1,4);
                    vesselInfo(i,4) = arriveTime+loadTime;
                    vesselInfo(i,5) = loadTime;
                    vesselInfo(i,6) = vesselInfo(i,5)*p;
                end;
            end;
        end;
        i = i+1;
        j = j+1;
    end;
    sumTime = 0;
    i = 1;
    while i<=length(chromosome)
        sumTime = sumTime+vesselInfo(i,6);
        i = i+1;
    end;
    fitValue = 100/(1+exp(sumTime/100000));
    popfit(:,a) = fitValue;
    a = a+1;
end
end

