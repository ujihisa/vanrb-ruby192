r, w = IO.pipe
spawn 'sleep 1; ls', out: w
w.close_write
result = r.read

puts result
puts '---'

result = `sleep 1; ls &`
puts result
