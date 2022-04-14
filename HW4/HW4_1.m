input = xlsread("HW4-1.xls",'sheet1','a2:b51')
output = xlsread("HW4-1.xls",'sheet1','c2:c51') 
slope = inv(transpose(input)*input)*transpose(input)*output