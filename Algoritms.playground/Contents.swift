//: Playground - noun: a place where people can play

import UIKit

/*
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
*/

// TODO: Java need to move to swift

// Array rows and column
//var mass = { {true, true, true} {true, false, true} {false, false, false} {false, true, false}}

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

//TODO: fix
/*func log2(x: Int) -> Int {
    
    var res: Int = 0
    //while ((x >>= 1) != 0) {//bitwise offset / divide on 2
 
    while ( x / 2  != 0) {
    res++
    }
    
    return res
    
}

log2(100000)*/


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

/// Recursion of Natural logarithm ln(N!)
/*
public static double ln(int N, double result) {

    if (N <= 1) return result;
    
    result += Math.log(N);
    return ln(N - 1, result);
}

public static void main(String[] args) {
    
    //for (int i = 0; i <= 3; i++) {
    System.out.println(ln(3, 0));
    // }
    
}*/



// Stanford courses
/*
link to file http://spark-public.s3.amazonaws.com/algo1/programming_prob/IntegerArray.txt
This file contains all of the 100,000 integers between 1 and 100,000 (inclusive) in some order, with no integer repeated.

Your task is to compute the number of inversions in the file given, where the ith row of the file indicates the ith entry of an array. Because of the large size of this array, you should implement the fast divide-and-conquer algorithm covered in the video lectures.*/

/*
import java.io.*;
import java.util.*;
import java.net.*;
import java.io.*;

/*
* To execute Java, please define "static void main" on a class
* named Solution.
*
* If you need more classes, simply define them inline.
*/

class Solution {
    
    static int a[] = new int[100000];
    
    public static long countSplitInversionsAndMerge(int start, int end, int leftStart, int leftEnd, int rightStart, int rightEnd) {
    int subArray1[] = new int[leftEnd - leftStart + 1];
    int subArray2[] = new int[rightEnd - rightStart + 1];
    
    int count = 0;
    for (int i = leftStart; i <= leftEnd; i++) {
    subArray1[count++] = a[i];
    }
    count = 0;
    for (int i = rightStart; i <= rightEnd; i++) {
    subArray2[count++] = a[i];
    }
    
    // merge and count inversions
    int leftPointer = 0, rightPointer = 0;
    long inversions = 0;
    for (int i = start; i <= end; i++) {
    if(leftPointer >= subArray1.length) {
    a[i] = subArray2[rightPointer++];
    
    }else if(rightPointer >= subArray2.length) {
    a[i] = subArray1[leftPointer++];
    
    }else if (subArray1[leftPointer] <= subArray2[rightPointer]) {
    a[i] = subArray1[leftPointer++];
    
    }else if(subArray1[leftPointer] > subArray2[rightPointer]) {
    for (int j = leftPointer; j < subArray1.length; j++) {
    //System.out.println(subArray1[j] + "," + subArray2[rightPointer]);
    }
    a[i] = subArray2[rightPointer++];
    inversions = inversions + subArray1.length - leftPointer;
    }
    }
    return inversions;
    }
    
    
    
    public static long countInversionsAndSort(int start, int end) {
    //System.out.println("start :: " + start + " end :: " + end);
    if(end - start == 1) {
    // two elements in array, just sort them and return if this is an inversion
    if (a[start] > a[end]) {
    int temp = a[start];
    a[start] = a[end];
    a[end] = temp;
    return 1;
    }else {
    return 0;
    }
    }else if(end == start) {
    // one element in array, no sorting required, can be a left / right inversion
    return 0;
    }else {
    int leftStart = start;
    int leftEnd = ((end - start) / 2 ) + start;
    int rightStart = ((end - start) / 2 ) + start +1;
    int rightEnd = end;
    long leftInversions = countInversionsAndSort(leftStart, leftEnd);
    long rightInversions = countInversionsAndSort(rightStart, rightEnd);
    long splitInversions = countSplitInversionsAndMerge(start, end, leftStart, leftEnd, rightStart, rightEnd);
    
    return leftInversions + rightInversions + splitInversions;
    }
    }
    
    
    public static void main(String[] args) {

    String inputFilePath = "http://spark-public.s3.amazonaws.com/algo1/programming_prob/IntegerArray.txt";

    // read and parse input file
    try {
    String strLine = "";
    int count = 0;
    InputStream fstream = new URL(inputFilePath).openStream();
    //FileInputStream fstream = new FileInputStream(inputFilePath);
    DataInputStream in = new DataInputStream(fstream);
    BufferedReader br = new BufferedReader(new InputStreamReader(in));
    while ((strLine = br.readLine()) != null) {
    // System.out.println(strLine);
    a[count ++] = Integer.parseInt(strLine);
    }
    fstream.close();
    } catch (FileNotFoundException e) {
    //e.printStackTrace();
    } catch (IOException e) {
    // e.printStackTrace();
    }
    
    //System.out.println(a);
    System.out.println(countInversionsAndSort(0, a.length-1));
    
    }
}*/

// print entered data in table (name and 2 numbers and result num1/num2 with 3 letters after ",")

/*
public static void printRow(String name, double x, double y) {
    System.out.printf("| %s | %.5f | %.5f | %.3f | \n", name, x, y, x/y);
}

public static void main(String[] args) {
    String name = "John Smith";
    double x = 12.567;
    double y = 45.872;
    
    for (int i = 0; i < 10; i++) {
        printRow(name, x, y);
}*/

