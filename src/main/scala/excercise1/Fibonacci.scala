package excercise1

import excercise1.MatrixOps._

object Fibonacci {
  /**
   * Fibonacci number, naive implementation
   * @param n
   * @return
   */
  def fibo1(n: Int): Long = {
    if (n == 2 || n == 1) 1
    else fibo1(n - 1) + fibo1(n - 2)
  }

  /**
   * Fibonacci number, less naive implementation with
   * tail recursion and counting up instead of down.
   * @param n
   * @return
   */
  def fibo2(n: Int) = {
    def inner(x: Int, acc: BigDecimal, pred: BigDecimal): BigDecimal = {
      if (x == n) acc
      else inner(x + 1, acc + pred, acc)
    }
    if (n == 1 || n == 2) 1L
    else inner(2, 1, 1)
  }

  /**
   * Implementation using Matrices and binary exponentiation
   * @param n
   * @return
   */
  def fibo3 (n: Int): BigDecimal = {
    def inner (Z: Matrix, times: Int, y: Matrix) : Matrix = {
      if (times == 0) y
      else {
        val N = times / 2
        if (times % 2 == 0) inner(square(Z), N, y)
        else inner(square(Z), N, multiplySquare(Z, y))
      }
    }
    if (n == 1 || n == 2) 1
    else multiplyWithVector(inner(BaseMatrix, n-2, IdentityMatrix))(0)(0)
  }
}
