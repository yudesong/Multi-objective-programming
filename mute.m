function mute(pop_size,chromo_size,pmute)
    global pop;
    for i = 1:pop_size-1
        if rand < pmute        
            flag = 0;
            while( flag==0 )
                randval1 = ceil((chromo_size-1)*rand) + 1;
                randval2 = ceil((chromo_size-1)*rand) + 1;
                if randval1 ~= randval2 && pop(i,randval1)~=0 && pop(i,randval2)~=0
                    flag = 1;
                end
            end
            temp = pop(i,randval1);
            pop(i,randval1) = pop(i,randval2);
            pop(i,randval2) = temp;
        end
    end
end

