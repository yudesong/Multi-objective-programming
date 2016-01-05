function initGroup(pop_size,vesselNum,berthNum)
global pop;
pop = zeros(pop_size,vesselNum+berthNum-1);
i = 1;
while i<=pop_size
	%产生随机自然数序列
	x = randperm(vesselNum);
	j = 1;
    while j<berthNum
        %随机选择一个位置插入分隔符0
        k = fix(rand(1)*vesselNum)+1;
        temp = x(k);
        x(k) = 0;
        x = [x,temp];
        j = j+1;
    end;
    %将产生的随机个体出啊如初始种群矩阵
    pop(i,:) = x;
    i = i+1;
end;
end
