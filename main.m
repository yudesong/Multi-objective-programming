clear
pop_size = 20; %种群大小
vesselNum = 8; %船舶数量
berthNum = 2; %船舶数量
chromo_size = vesselNum+berthNum-1; %染色体长度
generation_size = 100; %输入迭代次数
cross_rate = 0.8; %交叉概率
mutate_rate = 0.01; %变异概率
elitism = 1; %输入是否精英选择

[m,n,p] = GeneticAlgorithm(pop_size, vesselNum, berthNum, chromo_size, generation_size, cross_rate, mutate_rate, elitism);
