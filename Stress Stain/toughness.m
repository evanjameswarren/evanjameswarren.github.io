function  area = toughness(stress,strain)

area = 0;
for i = 2:length(stress)
    h = stress(i);
    dw = strain(i)-strain(i-1);
    dh = stress(i)-stress(i-1);
    area = area + h*dw + .5*dw*dh;
end
end