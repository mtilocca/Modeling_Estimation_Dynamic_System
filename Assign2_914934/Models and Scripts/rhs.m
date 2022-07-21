function dy = rhs(t, y, E, R1, R2, R3, L, C) % Mario Tilocca 914934
    dy(2) = -y(2)*(1/(C*(R2+R3))) + E(t)/(R2+R3) + y(1)*(R2/(R3+R2));
    dy(1) = -y(1)*((R1+R2)/L)+ dy(2)*(R2/L);
    dy=[dy(1);dy(2)];
   
end 