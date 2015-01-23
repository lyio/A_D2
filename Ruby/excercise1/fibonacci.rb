class Fibonacci 
	def initialize(n)
		@n = n
	end
	
	def fibo1
		fiboNaive(@n)
	end

	def fibo2
		fiboReverse(@n)
	end
	
	def fibo3
	
	end
	
	private 
	
	def fiboNaive(n)
		if (n == 1 or n == 2) then 1
		else fiboNaive(n-1) + fiboNaive(n-2)
		end
	end
	
	def fiboReverse(n)
		if (n == 1 or n == 2) then 1
		else countUp(n, 2, 1, 1)
		end
	end
	
	def countUp (n, x, acc, pred)
		if x == n then acc
		else countUp(n, x + 1, acc + pred, acc)
		end
	end
end

class Matrix
	attr_accessor :matrix, :rows, :columns
	
	def initialize(m)
		@matrix = m
		@rows = m.size
		@columns = m[0].size
		if @rows != @columns then raise "not a square matrix" end
	end
	
	def multiply(other)
		if !other.is_a? Matrix then raise "argument is not a matrix" end 
		b = other.matrix
		
		result = [
					 [@matrix[0][0]*b[0][0] + @matrix[0][1] * b[1][0], @matrix[0][0]*b[0][1] + @matrix[0][1] * b[1][1]],
					 [@matrix[1][0]*b[0][0] + @matrix[1][1] * b[1][0], @matrix[1][0]*b[0][1] + @matrix[1][1] * b[1][1]]
				 ]
	  
	  Matrix.new(result)
	end
	
	def to_s
		s = ""
		@matrix.each {|m| s += m.to_s + "\n"}
		s
	end
end	

f = Fibonacci.new(20)
puts f.fibo1
puts f.fibo2

m = [[1,1], [1,0]]
matrix1 = Matrix.new(m)
matrix2 = Matrix.new(m)
print matrix1


puts matrix1.multiply(matrix2)
