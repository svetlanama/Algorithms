// Stanford courses
//week 1
/*
Programminn question - 1  link to file http://spark-public.s3.amazonaws.com/algo1/programming_prob/IntegerArray.txt This file contains all of the 100,000 integers between 1 and 100,000 (inclusive) in some order, with no integer repeated.
 
Your task is to compute the number of inversions in the file given, where the ith row of the file indicates the ith entry of an array.
 Because of the large size of this array, you should implement the fast divide-and-conquer algorithm covered in the video lectures. The numeric answer for the given input file should be typed in the space below.

So if your answer is 1198233847, then just type 1198233847 in the space provided without any space / commas / any other punctuation marks. You can make up to 5 attempts, and we'll use the best one for grading.
(We do not require you to submit your code, so feel free to use any programming language you want --- just type the final numeric answer in the following space.)
[TIP: before submitting, first test the correctness of your program on some small test files or your own devising.post your best test cases to the discussion forums to help your fellow students!]  
*/

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
/// week 3

/*
Programminn question - 3
Download the text file here. (Right click and save link as)
The file contains the adjacency list representation of a simple undirected graph. There are 200 vertices labeled 1 to 200. The first column in the file represents the vertex label, and the particular row (other entries except the first column) tells all the vertices that the vertex is adjacent to. So for example, the
6th row looks like : "6 155 56 52 120 ......". This just means that the vertex with label 6 is adjacent to (i.e., shares an edge with) the vertices with labels 155,56,52,120,......,etc   Your task is to code up and run the randomized contraction algorithm for the min cut problem and use it on the above graph to compute the min cut (i.e., the minimum-possible number of crossing edges). (HINT: Note that you'll have to figure out an implementation of edge contractions. Initially, you might want to do this naively, creating a new graph from the old every time there's an edge contraction. But you should also think about more efficient implementations.) (WARNING: As per the video lectures, please make sure to run the algorithm many times with different random seeds, and remember the smallest cut that you ever find.) Write your numeric answer in the space provided. So e.g., if your answer is 5, just type 5 in the space provided.
  
answer: 17

*/
/*
import java.io.*;
import java.util.*;
import java.net.*;


/**
* KargerMinCut.java
* <p>
* Randomized contraction algorithm for the minimize cut problem.
*/

// class for node in graph
class Node {
public int id;
public LinkedList<Integer> nodeEdge;
}

// AdjacencyLists for graph
class AdjacencyLists {
public int len = 200; // number of node
public Hashtable<Integer, Node> nodeHash = new Hashtable();
// add vertex(node),id from 1
public void addVertex(int id) {
Node node = new Node();
node.id = id; // from index of 0
node.nodeEdge = new LinkedList();
nodeHash.put(id, node);
}

public void addAdjvex(int start, int end) {
nodeHash.get(start).nodeEdge.addLast(end);
}

public int getAdjvex(int node, int index) {
return nodeHash.get(node).nodeEdge.get(index);
}

public void contractVertex(int nodeA, int nodeB) {
deleteEdge(nodeA, nodeB); // delete the edge nodeB in nodeA
findEnd(nodeA, nodeB); // change nodeB to a in node change
addList(nodeA, nodeB); // add nodeB in the last of nodeA
nodeHash.remove(nodeB);// remove nodeB
}

// delete edge,number of edge need be changed is >=1, even >2...
public void deleteEdge(int nodeA, int nodeB) {
while (nodeHash.get(nodeA).nodeEdge.contains(nodeB)) {
int index = nodeHash.get(nodeA).nodeEdge.indexOf(nodeB);
nodeHash.get(nodeA).nodeEdge.remove(index);
//                        print(nodeA);
}
while (nodeHash.get(nodeB).nodeEdge.contains(nodeA)) {
int index = nodeHash.get(nodeB).nodeEdge.indexOf(nodeA);
nodeHash.get(nodeB).nodeEdge.remove(index);
//                        print(nodeB);
}
}

public void findEnd(int nodeA, int nodeB) {
boolean record[] = new boolean[len];// check the node which has been changed yet
for (int index = 0; index < nodeHash.get(nodeB).nodeEdge.size(); index++) {
int change = nodeHash.get(nodeB).nodeEdge.get(index);
if (record[change-1] == false) {
changeToEnd(nodeA, nodeB, change);
record[change-1] = true;
}
}
}

public void changeToEnd(int nodeA, int nodeB, int change) {
for (int index = 0; index < nodeHash.get(change).nodeEdge.size(); index++) {
if (nodeHash.get(change).nodeEdge.get(index) == nodeB) {
nodeHash.get(change).nodeEdge.set(index, nodeA);
}
}
}

public void addList(int nodeA, int nodeB) {
while (!nodeHash.get(nodeB).nodeEdge.isEmpty()) {
nodeHash.get(nodeA).nodeEdge.addLast(nodeHash.get(nodeB).nodeEdge
.pop());
}
//                print(nodeA);
}

// computer the edge number of nodeHash.get(0)
public int computerEdge(int node) {
int n = nodeHash.get(node).nodeEdge.size();
return n;
}

// print edges of nodeA, for test
public void print(int nodeA) {
if (!nodeHash.get(nodeA).nodeEdge.isEmpty()) {
System.out.print("[" + nodeA + "]:");
for (int index = 0; index < nodeHash.get(nodeA).nodeEdge.size(); index++) {
System.out.print(nodeHash.get(nodeA).nodeEdge.get(index) + "-");
}
System.out.println();
}
}
}

// Randomized contraction algorithm for the minimize cut problem
class Solution {
private AdjacencyLists graph = new AdjacencyLists();
private int nodeLen = graph.len;
private int cutNum;
private int nodeA, nodeB;
private int min = nodeLen - 1;
private ArrayList<Integer> arraySet = new ArrayList();
private int count = 0;

public Solution() {
for (count = 0; count < 50; count++) {
input();
contract();
}
System.out.println(min);
}

// input the graph file
public void input() {
cutNum = nodeLen - 1;
graph = new AdjacencyLists();
arraySet = new ArrayList();
try {
String file = "http://spark-public.s3.amazonaws.com/algo1/programming_prob/kargerMinCut.txt";



InputStream fstream = new URL(file).openStream();
DataInputStream in = new DataInputStream(fstream);
BufferedReader br = new BufferedReader(new InputStreamReader(in));

//  FileReader in = new FileReader(file);
// BufferedReader br = new BufferedReader(in);
String s;
int x;
while ((s = br.readLine()) != null) {
Scanner sca = new Scanner(s);
x = sca.nextInt();
graph.addVertex(x);
// System.out.print(x); //test
while (sca.hasNext()) {
int y = sca.nextInt();
graph.addAdjvex(x, y);
}
}

fstream.close();

} catch (Exception e) {
e.printStackTrace();
}
initSet();
}

// initialize the arraySet for the random set
public void initSet() {
for (int j = 0; j < nodeLen; j++) {
arraySet.add(j, j+1);
// System.out.println(arraySet.get(j)); //test
}
}

// contract two random node until there are only two node left
public void contract() {
int num;
while (arraySet.size() > 2) {
// System.out.println(arraySet.size()); //test
randEdge();
graph.contractVertex(nodeA, nodeB);
// System.out.println(graph.getLen()); //test
tempNum(nodeA);
}
// when the contract is end, print the current and in all minNum
if (arraySet.size() == 2) {
if (cutNum < min) {
min = cutNum;
}
// if(graph.UFO < min){
// min = graph.UFO;
// } //test
System.out.println("///" + cutNum + " - " + min + "///" + count); // test
}
}

// computer the edge number of node chosen
public void tempNum(int a) {
int num = graph.computerEdge(a); // computer edge of a after contract
if (num < cutNum) {
cutNum = num;
}
// graph.print(a); //test
// System.out.println("///////"+num + "///////"); //test
}

// randomize a edge
public void randEdge() {
Random rand = new Random();
int indexOfNodeA;
int indexOfNodeB;
indexOfNodeA = rand.nextInt(arraySet.size());// from 0 to getLen()-1
nodeA = arraySet.get(indexOfNodeA); // from 1 to size
int randomSeed = graph.nodeHash.get(nodeA).nodeEdge.size();//nodeEdge index start from 0
indexOfNodeB = rand.nextInt(randomSeed); // from 0 to
// nodeA.nodeEdge.size()
nodeB = graph.getAdjvex(nodeA, indexOfNodeB);
arraySet.remove(arraySet.indexOf(nodeB));
//                System.out.println(nodeA + "+++" + nodeB); // test
}

public static void main(String[] args) {
Solution test = new Solution(); // test
}
}
*/
