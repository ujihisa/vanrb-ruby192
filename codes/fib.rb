#!time /usr/bin/ruby
def fib(n)
  return n if n < 2
  fib(n-2) + fib(n-1)
end

p RUBY_VERSION
p fib 31
