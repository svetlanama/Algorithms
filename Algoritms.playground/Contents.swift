//: Playground - noun: a place where people can play

import UIKit


// Euclid's algorithm = the max common divisor of two integers

func gcd(num1: Int, num2: Int) -> Int {
    
    if (num2 == 0) {
        return num1
    }
    
    var r = num1 % num2
    return gcd(num2, r)
}

gcd(11, 100)


// Average of numbers in array

var mass = [1,2,2,3,3,5,5,5,7,7];
func avg(arr: [Int]) -> Int {
    
    var sum = 0;
    for var i = 0; i < arr.count; i++ {
        sum += arr[i]
    }
    return sum / mass.count
}

avg(mass)

// Algorithm Fibonacci

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



// Code which puts the binary representation of a variable N into String s
func toBinary() {
var s = "";
var N = 10;
for var n = N; n > 0; n/=2  {
    s = String((n % 2)) + s
    print(s)
}
}

toBinary();


// TODO: Java need to move to swift

// Array rows and column
/*
boolean[][] mass = {
    {true, true, true},
    {true, false, true},
    {false, false, false},
    {false, true, false},
};


for (int i = 0; i < mass.length; i++) {

    if (i == 0) {
        for (int k = 0; k < mass[i].length; k++) {
            System.out.print((k == 0 ? "  " : "") + (k + 1) + "\t");
        }
    }
    System.out.print("\n" + (i + 1) + " ");
    // System.out.print("\n");

    for (int j = 0; j < mass[i].length; j++) {
        System.out.print((mass[i][j] ? "*" : "-") + "\t");
    }
}
*/

// code snippet to display a two-dimensional array transposition with M rows and N columns (rows are replaced by columns)
// фрагмент кода для вывода транспозиции двумерного массива с М строками и 7Vстолбцами (строки заменены столбцами).
/*
int[][] mass = {
    {1,2,3},
    {4,5,6},
    {7,8,9}
};

int[][] mass2 = new int[3][3];
    for (int i = 0; i < mass.length; i++) {
        for (int j = 0; j < mass[i].length; j++) {
            mass2[i][j] = mass[j][i];
        }
    }

    printArr(mass2);
*/

// lg() which takes as an argument N (type Int) and returns max Int value, not bigger than binary logarithm of N log2(N)
// метод lg(), который принимает в качестве аргумента значение N типа int и возвращает наибольшее целое число, не большее, чем двоичный логарифм N.
/*
public static int log2(int x) {

    int res = 0;
    //while ((x >>= 1) != 0) //bitwise offset / divide on 2
    while ((x /= 2) != 0)
        res++;
    
    return res;
    
}*/

// Histogramm
/*
public static int[] histogram (int[] arr, int M) {

    int[] h = new int[M];
    int N = arr.length;

    for (int i = 0; i < N; i++) {
        System.out.println(arr[i]);
        if (M > arr[i]) {
            System.out.println("=======");
            System.out.println(h[arr[i]]++);
        }
    }

    return h;
}

int[] arr = {0, 1, 1, 2, 3, 4, 5, 1};
System.out.println(Arrays.toString(histogram(arr, 6)));
*/

/*
public static String exR1(int n) {

    if (n <= 0) return "";
    return exR1(n - 3) + " " + n + " " + exR1(n - 2) + " " + n;
}

public static void main(String[] args) {
    System.out.println(exR1(6));
}
*/


// F(N) save calculations into array
/*
public static long Fib(int N) {

    System.out.println(N);
    System.out.println("=====");
    long[] f = new long[N+1];
    return Fib(N, f);
}

public static long Fib(int N, long[] f) {

    System.out.println(Arrays.toString(f));
    System.out.println("=====");
    if (f[N] == 0) {
        if (N == 1)
            f[N] = 1;
        else if (N > 1)
            f[N] = Fib(N-1, f) + Fib(N-2, f);
    }

    return f[N];
}

public static void main(String[] args) {

    for (int N = 0; N < 10; N++) {
    System.out.println(N + " " + Fib(N));
    }

*/

/// Natural logarithm ln(N!)

