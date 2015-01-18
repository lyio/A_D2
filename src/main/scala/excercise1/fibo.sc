def fibo1(n: Int): Long = {
  if (n == 2 || n == 1) 1
  else fibo1(n - 1) + fibo1(n - 2)
}

def fibo2(n: Int) = {
  def inner(x: Int, acc: Long, pred: Long): Long = {
    if (x == n) acc
    else inner(x + 1, acc + pred, acc)
  }
  if (n == 1 || n == 2) 1L
  else inner(2, 1, 1)
}
fibo2(80)

type Matrix = Vector[Vector[Long]]

def multiply (a: Matrix, b: Matrix) : Matrix = {
  Vector(
    Vector(a(0)(0)*b(0)(0) + a(0)(1) * b(1)(0), a(0)(0)*b(0)(1) + a(0)(1) * b(1)(1)),
    Vector(a(1)(0)*b(0)(0) + a(1)(1) * b(1)(0), a(1)(0)*b(0)(1) + a(1)(1) * b(1)(1))
  )
}

def square(a: Matrix) = multiply(a, a)

val V = Vector(Vector(1), Vector(1))

def multiplyWithVector(a: Matrix) : Matrix = {
  Vector(
    Vector(a(0)(0)*V(0)(0) + a(0)(1)*V(1)(0)),
    Vector()
  )
}
val a: Matrix = Vector(Vector(1L, 1L), Vector(1L, 0))

val A = a
val Y : Matrix = Vector(Vector(1, 0), Vector(0,1))

def fibo3 (n: Int): Long = {
  def inner (Z: Matrix, times: Int, y: Matrix) : Matrix = {
    if (times == 0) y
    else {
      val N = times / 2
      if (times % 2 == 0) inner(square(Z), N, y)
      else inner(square(Z), N, multiply(Z, y))
    }
  }
  if (n == 1 || n == 2) 1
  else multiplyWithVector(inner(A, n-2, Y))(0)(0)
}

val number = 80
fibo2(number)
fibo3(number)
fibo1(number)
/*
* 1 1 2 3 5 8 13 21
* */
