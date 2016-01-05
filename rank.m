function rank(pop_size,vesselNum,berthNum)
global popfit;
global fitness_table;
global fitness_avg;
global best_fitness;
global best_individual;
global best_generation;
global pop;
global G;

for i=1:pop_size    
    fitness_table(i) = 0.;
end

min = 1;
temp = 1;
temp1(vesselNum+berthNum-1)=0;
for i=1:pop_size
    min = i;
    for j = i+1:pop_size
        if popfit(j)<popfit(min);
            min = j;
        end
    end
    if min~=i
        temp = popfit(i);
        popfit(i) = popfit(min);
        popfit(min) = temp;
        for k = 1:vesselNum+berthNum-1
            temp1(k) = pop(i,k);
            pop(i,k) = pop(min,k);
            pop(min,k) = temp1(k);
        end
    end
    
end

for i=1:pop_size
    if i==1
        fitness_table(i) = fitness_table(i) + popfit(i);    
    else
        fitness_table(i) = fitness_table(i-1) + popfit(i);
    end
end
fitness_table()
fitness_avg(G) = fitness_table(pop_size)/pop_size;


if popfit(pop_size) > best_fitness
    best_fitness = popfit(pop_size);
    best_generation = G;
    for j=1:vesselNum+berthNum-1
        best_individual(j) = pop(pop_size,j);
    end
end

clear i;
clear j;
clear k;
clear min;
clear temp;
clear temp1;

