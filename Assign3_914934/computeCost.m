function h = computeCost(k)
    global x y 
    k1=k(1); k2=k(2);
    h = sum((y - k1*(1 - exp(x *k2))).^2);
end 