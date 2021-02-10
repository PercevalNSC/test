def fib(n)
    case n
    when 1 then
        return 1
    when 2 then
        return 2
    else
        return fib(n-1) + fib(n-2)
    end
end

x = 10
for i in 1 .. x
    puts fib(i)
end