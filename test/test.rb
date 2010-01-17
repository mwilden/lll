require File.dirname(__FILE__) + '/../lib/lll'

puts "Message alone"
lll 'Message'

puts "\nExpression alone"
x = 1
lll{'x'}

puts "\nMessage and expression"
lll('Message'){'x'}

puts "\nArray"
x = [1,2]
lll{'x'}