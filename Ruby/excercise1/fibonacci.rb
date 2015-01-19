class Fibonacci 
	def initialize(n)
		@n = n
	end
	
	def fibo1
		if (@n == 1 or @n == 2) then 1
		else fibo1(@n-1) + fibo1(@n-2)
		end
	end

	def fibo2
		if (@n == 1 or @n == 2) then 1
		else countUp(@n, 2, 1, 1)
		end
	end
	
	private 
	def countUp (n, x, acc, pred)
		if x == n then acc
		else countUp(n, x + 1, acc + pred, acc)
		end
	end
end


f = Fibonacci.new(3)

puts f.fibo1
puts f.fibo2
