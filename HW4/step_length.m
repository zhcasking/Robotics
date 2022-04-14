function [t] = step_length(q,i,t,gradient,convex)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    alpha = 0.4;
    beta =  0.7;

    while (convex( q(1)-t*gradient(1) , q(2)-t*gradient(2) , q(3)-t*gradient(3), q(4)-t*gradient(4),i) > convex(q(1),q(2),q(3),q(4),i) + alpha*t*(gradient')*gradient)
   
        t = t*beta; 
    end

end