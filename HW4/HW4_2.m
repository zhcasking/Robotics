ax = xlsread("HW4-2.xls",'sheet1','a2:a101');
ay = xlsread("HW4-2.xls",'sheet1','b2:b101');
az = xlsread("HW4-2.xls",'sheet1','c2:c101');
g = 9.8;
error = @(q1,q2,q3,q4,i)[  (-2)  * g * ( q2 * q4 - q1 * q3 ) - ax(i) ;
                           (-2)  * g * ( q1 * q2 + q3 * q4 ) - ay(i) ;
                           (-2)  * g * ( 0.5 - q2 * q2 - q3 * q3 ) - az(i) ];
    
convex = @(q1,q2,q3,q4,i) transpose(error(q1,q2,q3,q4,i))*error(q1,q2,q3,q4,i);

for i = 1:100
   q = [1;0;0;0]; 
   t = 1;
   gradient = [1;1;1;1];
   num = 1

   while(sqrt(num) >= 1)
       j = (-2*g)* [ -q(3) , q(4) , -q(1) , q(2);
                     q(2) , q(1) , q(4) , q(3) ;
                     0 , -2*q(2) , -2*q(3) , 0];
       
       gradient =  ( transpose(j) * error(q(1),q(2),q(3),q(4),i) );
       norm = sqrt(transpose(gradient) * gradient);
    
       t = step_length(q,i,t,gradient,convex);
       
       q = q - t * gradient / norm;

       num = gradient(1)*gradient(1)+gradient(2)*gradient(2)+gradient(3)*gradient(3)+gradient(4)*gradient(4);
   end
end