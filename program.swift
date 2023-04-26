import Cocoa

//Salvador Medina-Ruiz COSC 341
//Problem 7
func isPrime(x: Int) -> Bool
{
    if (x == 0 || x == 1){ //0 and 1 are not prime
        return false;
    }
    else if (x == 2){ //2 is prime. Special case.
      return true;
    }
    for i in 2...(x/2)+1{ //Loops from 2 to x/2+1 which tests if its prime or not
        if (x % i == 0){ //Checks if x divided by i has a remainder of 0
            return false; //If it does have a remainder 0, then its not prime
        }
    }
    return true; //Otherwise, its prime
}

func displayPrimes(x: Int)
{
    var boolean_result: Bool //Creates the boolean boolean_result 
    for i in 0...x{ //Starts from 0 and goes until x to check every number if its prime
        boolean_result = isPrime(x: i); //boolean_result equals the boolean result of isPrime with the current i
        if (boolean_result == true){ //Checks if boolean_result is true
          print(i); //If it is, then current i is prime, so prints it.
        }
    }
}
//Problem 8
func tax(income: Double, status: String) -> Double
{
    var tax_amount: Double = 0; //Creates tax_amount and assigns it 0
    var tax_rate: Double = 0; //Creates tax_rate and assigns it 0
    if (status.uppercased() == "SINGLE" && income < 30000){ //Checks if status is single and income is less than 30,000
        tax_rate = 0.20; //If so, tax_rate is 20%
    }
    else if (status.uppercased() == "SINGLE" && income >= 30000){ //Checks if status is single and income is greater than or equal to 30,000
        tax_rate = 0.25; //If so, tax_rate is 25%
    }
    else if(status.uppercased() == "MARRIED" && income < 50000){ //Checks if status is married and income is less than 50,000
        tax_rate = 0.10; //If so, tax_rate is 10%
    }
    else if (status.uppercased() == "MARRIED" && income >= 50000){ //Checks if status is married and income is greater than or equal to 50,000
        tax_rate = 0.15; //If so, tax_rate is 15%
    }
    tax_amount = income * tax_rate; //Multiplies income and tax_rate and puts that into tax_amount
    return tax_amount; //returns tax_amount
}
//Problem 9
func quadratic(a: Double, b: Double, c: Double) -> (s1: Double, s2: Double)
{
    var solution1: Double = 0; //Creates solution1 and assigns it 0
    var solution2: Double = 0; //Creates solution2 and assigns it 0
    var is_there_solution: Double = b * b - 4*a*c; //creates is_there_solution and checks if solution even exists

    if (is_there_solution >= 0){ //if is_there_solution is >= 0, then solution(s) exists
        solution1 = (-b + sqrt(is_there_solution))/(2*a); //Calculates solution1
        solution2 = (-b - sqrt(is_there_solution))/(2*a); //Calculates solution2
    }
    return (solution1, solution2); //Returns solution1 and solution2
}
//Problem 10
func createIdPassword(last: String, first: String) -> (id: String, pass: String)
{
    var last_name_array = Array(last.uppercased()); //Creates last_name_array that is a copy of an uppercased last name
    var first_name_array = Array(first.uppercased()); //Creates first_name_array that is a copy of an uppercased first name
    var id = String(first_name_array[0]) + last_name_array; //Creates id that concatenates first character in first_name_array, which is converted to a String, and last_name_array
    var password = String(first_name_array[0]) + String(first_name_array[first_name_array.count-1]) + String(last_name_array[0]) + String(last_name_array[1]) + String(last_name_array[2]) + String(first_name_array.count) + String(last_name_array.count); //Does something very similar to the previous statement, but for password
    return (id, password); //returns both id and password
}
//Problem 11
func factorial(n: Int) -> Int
{
    if (n == 0){ //Base case. Checks if n is 0
        return 1; //If so, return 1
    }
    else{ //If n is not 0...
        return n * factorial(n: n - 1); //Return n multiplied by a recursive call of factorial with n now equaling n-1
    }
}
//Problem 12
func sort(array_of_nums: [Int]) -> [Int]
{
    var sorted_array_nums: [Int] = array_of_nums; //Copies array_of_nums in sorted_array_nums
    var temp_list_value: Int = 0; //Creates temp_list_value with 0
    var min_value: Int = 0; //Creates min_value with 0

    for i in 0...sorted_array_nums.count-1{ //i starts from 0 and goes until sorted_array_nums length minus 1
        min_value = i; //min_value equals current i value
        for i2 in i...sorted_array_nums.count-1{ //i2 starts from current i and goes until sorted_array_nums length minus 1
            if (sorted_array_nums[i2] < sorted_array_nums[min_value]){ //If current i2 value in sorted_array_nums is less then the min_value in the same array...
                min_value = i2; //i2 is the new min_value
            }
        }

        if (min_value != i){ //If min_value DOES NOT EQUAL current i the selection sort starts...
            temp_list_value = sorted_array_nums[i]; //temp_list_value is current i value in sorted_array_nums
            sorted_array_nums[i] = sorted_array_nums[min_value]; //current i value in sorted_array_nums equals the min_value in the same array
            sorted_array_nums[min_value] = temp_list_value; //Finally, sort is complete with min_value in sorted_array_nums equals the temp_list_value from earlier
        }
    }
    return sorted_array_nums; //Return sorted_array_nums
}
