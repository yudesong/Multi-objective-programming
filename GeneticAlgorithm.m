function [m,n,p] = GeneticAlgorithm(pop_size, vesselNum, berthNum, chromo_size, generation_size, cross_rate, mutate_rate, elitism)
global G ; %当前代
global fitness_value; %当前代适应度矩阵
global best_fitness; %历代最佳适应值
global fitness_avg; %历代平均适应值矩阵
global best_individual; %历代最佳个体
global best_generation; %最佳个体出现代

fitness_avg = zeros(generation_size,1);
fitness_value(pop_size) = 0.;
best_fitness = 0.;
best_generation = 0;
initGroup(pop_size,vesselNum,berthNum);

for G=1:generation_size   
    fitness(pop_size, vesselNum, berthNum);  %计算适应度 
    rank(pop_size, vesselNum, berthNum);  %对个体按适应度大小进行排序
    select(pop_size, chromo_size, elitism); %选择操作
    CrossOverOne(pop_size,chromo_size,cross_rate); %交叉操作
    mute(pop_size,chromo_size,mutate_rate); %变异操作
end
plotGA(generation_size);%打印算法迭代过程
m = best_individual;%获得最佳个体
n = best_fitness;%获得最佳适应度
p = best_generation;%获得最佳个体出现代
