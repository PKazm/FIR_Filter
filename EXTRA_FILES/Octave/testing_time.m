pkg load parallel;

global hello = 10;


function [yellow] = test_fun(pizza)
    global hello;
    yellow = hello + pizza;
endfunction



test_fun_2 = @(A, B) test_function_file(A, B);

A1 = [];
A2 = [];
for i = 0:20
    A1 = [A1, i];
    A2 = [A2, 6];
endfor

monday = test_fun(10, 6)
[tuesday, thursday, friday] = pararrayfun(nproc-1, test_fun_2, 0:20, 6, "UniformOutput", false)

