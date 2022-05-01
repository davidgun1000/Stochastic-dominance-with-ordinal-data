% ordinal dominance program

%step1 estimating the proportion using dirichlet distribution

load('health_data_2002.mat');
%load('health_data_2010.mat');

x = jgh1_mod;

id_1 = x == 1;
n1 = sum(id_1);
id_2 = x == 2;
n2 = sum(id_2);
id_3 = x == 3;
n3 = sum(id_3);
id_4 = x == 4;
n4 = sum(id_4);
id_5 = x == 5;
n5 = sum(id_5);

m = 10000;

for i = 1:m
    
    prop = dirich_rnd([n1 ; n2 ; n3; n4; n5]);
    prop_2010(i,:) = prop';
end

save('param_2002.mat','prop_2002');

