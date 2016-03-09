//: Playground - noun: a place where people can play

import UIKit

//SWIFT


//ALGO: Euclid's algorithm = the max common divisor of two integers

func gcd(num1: Int, num2: Int) -> Int {
    
    if (num2 == 0) {
        return num1
    }
    
    let r = num1 % num2
    return gcd(num2, num2: r)
}

gcd(11, num2: 100)



//ALGO: Average of numbers in array

var mass = [1,2,2,3,3,5,5,5,7,7];
func avg(arr: [Int]) -> Int {
    
    var sum = 0;
    for var i = 0; i < arr.count; i++ {
        sum += arr[i]
    }
    return sum / mass.count
}

avg(mass)


//ALGO: Algorithm Fibonacci

func fibonacci() {
    
    var f = 0;
    var g = 1;
    
    for var i = 0; i < 15; i++ {
        print(f);
        f = f + g;
        g = f - g;
    }
}
fibonacci()



//ALGO: Code which puts the binary representation of a variable N into String s

func toBinary() {
var s = "";
let N = 10;
for var n = N; n > 0; n/=2  {
    s = String((n % 2)) + s
    print(s)
}
}

toBinary();







