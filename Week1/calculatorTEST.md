CONSTANT TEST
4+5 = INT 9
4*5 = INT 20
a*5 = UNBOUND VARIABLE
5-4 = INT 1
0-4 + 2 = INT -2 
(0-5)*(0-5) = INT 25
(0-5)*5 = INT -25
LET test
let a = 5 in a+5 = 10
let a = 5 in let c = 4 in a+c = 9
let a = (0-5) in a+5 = 0
SUM test
sum x = 1 to 4 of x*x = 10
sum x = 1 to -4 of x*x = parse error due to bounding
sum x = (0-5) to 10 of x*x = 40
PROD test
prod x = 1 to 5 of x*x = 120
prod x = (0-5) to 6 of x*x = 0 as we cross zero
prod x = (0-5) to 0-1 of x*x = -120

MAX test
max x = 0 to 10 of 5 * x - x * x = 6
max x = 0 to 10 of x = 10
max x = 0 to 10 of x * x - 2 * x = 80

ARGMAX test
argmax x = 0 to 10 of 5 * x - x * x = 2
argmax x = 0 to 10 of x = 10
argmax x = 0 to 10 of xx+10*2*(0-2*x) = 0