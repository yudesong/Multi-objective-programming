function crossover(pop_size,chromo_size,pcross)
    global pop;
    for i = 1:pop_size/2
        if rand < pcross  
            randval1 = floor((chromo_size-1)*rand) + 1;
            for randval=randval1:chromo_size
                temp = pop(2*i-1,randval);
                pop(2*i-1,randval) = pop(2*i,randval);
                pop(2*i,randval) = temp;
            end
            for j=1:randval1-1
            for m=randval1:chromo_size
               if pop(2*i-1,j) == pop(2*i-1,m) 
                   for j1=1:randval1-1
                   for m1=randval1:chromo_size    
                       if pop(2*i,j1) == pop(2*i,m1)
                            temp = pop(2*i-1,j);
                            pop(2*i-1,j) = pop(2*i,j1);
                            pop(2*i,j1) = temp; 
                           
                       end
                   end
                   end
               end 
            end
            end 
        end
    end
