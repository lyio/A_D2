def fibo1(n)
	if (n == 1 or n == 2) then 1
	else fibo1(n-1) + fibo1(n-2)
	end
end


def countUp (n, x, acc, pred)
	if x == n then acc
	else countUp(n, x + 1, acc + pred, acc)
	end
end

def fibo2(n)
	if (n == 1 or n == 2) then 1
	else countUp(n, 2, 1, 1)
	end
end

puts fibo1(3)
puts fibo2(3)