open System // Allows all the basic stuff like read and write

let hello() = //Create function syntacs, white spaces define code blocks
    printf "Enter a name: "

    let name = Console.ReadLine()

    printfn "Hello %s" name

let floatFormat() =
    let test = 3.1548462186524435
    printf "test is: %f \n" test
    printf "test with 5 digits is: %.5f\n" test
    printf "test with paddiong: %c%5c\n" 'a' 'b'
    printfn "Dynamic padding %c %*c" 'c' 10 'd'

let bind_stuff() =  
    let mutable weight = 175
    printf "Weight is: %i\n" weight
    weight <- 50 //change the value of a variable
    printf "Weight is: %i\n" weight

    let changeMe = ref 10
    printf "changeMe is: %i\n" ! changeMe
    changeMe := 50 //Another way to change the values
    printf "changeMe is: %i\n" ! changeMe

let do_funcs() =
    

    let get_sum (x : int, y : int) : int = x + y //function name, variables the function takes, output it returns

    printfn "10 + 5 = %i" (get_sum(10, 5))

    let rec factorial x = //Example of recursive function
        if x <  1 then 1    
        else x * factorial (x - 1)

    printfn "Factorial 4: %i" (factorial 4)

    let rand_list = [1; 4; 3]


    let rand_list2 = List.map (fun x -> x * 2) rand_list //List.map goes through every element and adds an effect

    printfn "Original list: %A" rand_list // %A allows you to print all elements at once
    printfn "Updated list: %A" rand_list2 

    
    rand_list2 //We put the array/list that we want to work on at the top and then we pipe using |> to indicate that we are still working with that array/list
    |> List.filter (fun v -> (v % 2) = 0)//piping where we use a filter where we filter every element that doesn't meet the condition out of the list
    |> List.map (fun x -> x * 2)
    |> printfn "Even doubles : %A"

    let mult_num x = x * 3
    let add_num y = y + 10

    let mult_add = mult_num >> add_num
    let add_mult = mult_num << add_num
    printfn "mult_add 10 is %i %5c add_mult is 5 %i" (mult_add 10) ' ' (add_mult 5)


let do_math () =
    let number = 3
    let number2 = 3.435634
    printfn "Type of Number is: %A" (number.GetType())
    printfn "Type of Number2 is: %A" (number2.GetType())



do_math () 
// System.Console.ReadKey() |> ignore  //You don't really need system as we used open system on the first line
                                    //This line just closes the console when the user enters something 

