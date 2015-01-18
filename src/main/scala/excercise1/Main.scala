package excercise1

object Main extends App {
  val n = args(0).toInt
  if (n < 45) println("Naive implementation: ", Fibonacci.fibo1(n))
  println("Less naive implementation: ", Fibonacci.fibo2(n))
  println("O(log n) implementation: ", Fibonacci.fibo3(n))
}
