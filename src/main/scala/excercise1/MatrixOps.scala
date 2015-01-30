package excercise1

object MatrixOps {

  type Matrix = Vector[Vector[BigDecimal]]

  val V = Vector(Vector(1), Vector(1))
  val BaseMatrix: Matrix = Vector(Vector(1L, 1L), Vector(1L, 0))
  val IdentityMatrix : Matrix = Vector(Vector(1, 0), Vector(0,1))

  def multiplySquare (a: Matrix, b: Matrix) : Matrix = {
    Vector(
      Vector(a(0)(0)*b(0)(0) + a(0)(1) * b(1)(0), a(0)(0)*b(0)(1) + a(0)(1) * b(1)(1)),
      Vector(a(1)(0)*b(0)(0) + a(1)(1) * b(1)(0), a(1)(0)*b(0)(1) + a(1)(1) * b(1)(1))
    )
  }

  def square(a: Matrix) = multiplySquare(a, a)

  def multiplyWithVector(a: Matrix) : Matrix = {
    Vector(
      Vector(a(0)(0)*V(0)(0) + a(0)(1)*V(1)(0)),
      Vector()
    )
  }
}
