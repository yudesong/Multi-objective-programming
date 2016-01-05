%计算装卸时间函数
function loadTime = panLoadTime(grossType,grossWeight,berthNo)
    machineNum = 0;
    switch berthNo
        case 1
            machineNum = 2;
        case 2
            machineNum = 4;
        case 4
            machineNum = 3;
    end
    switch grossType
        case 1
            loadTime = grossWeight/(2.23*machineNum);
        case 2
            loadTime = grossWeight/(1.46*machineNum);
        case 3
            loadTime = grossWeight/(5.09*machineNum);
        case 4
            loadTime = grossWeight/(5.11*machineNum);
        case 5
            loadTime = grossWeight/(3.25*machineNum);
        case 6
            loadTime = grossWeight/(4.13*machineNum);            
        case 7
            loadTime = grossWeight/(2.04*machineNum);
    end

