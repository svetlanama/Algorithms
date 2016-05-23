// Define the growing of functions logarithm and sqrt

    func logWithBase(base: Double, n: Double) -> Double {
      let result = log(n)/log(base)
      return result
    }      
    func getSqrt(from: Double) -> Double {
      let result = sqrt(from)
      return result
    }

Let’s take:
base = 2
n = 2
And then increase n in 400 times, call it n2 = 800

    let logN =  logWithBase(base, n: n)  // 1
    let logN2 = logWithBase(base, n: n2) // 9.643856189774725

    let sqrtN = getSqrt(n)   // 1.414213562373095
    let sqrtN2 = getSqrt(n2) // 28.2842712474619

You will see that the logarithm function grows ON, but the n^2 grows IN In conclusion logarithms grows rather slower.

![Alt text](https://github.com/svetlanama/Algorithms/blob/master/images/growing%20graph.png "Demo")
