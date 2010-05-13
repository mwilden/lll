# Used in debugging to display an expression and its value. Examples:
#   x = 1
#   lll{'x'} #=> x = 1
#   lll("a message"){'x'} #=> a message: x = 1
#   lll "a message" #=> a message
# Enumerable members are output on separate lines

def lll msg = nil, &block
  s = " "
  expression_string = ''
  expression_value = 0
  if block_given?
    s << msg + ': ' if msg
    expression_string = block.call
    expression_value = eval(expression_string, block)
    s << expression_string + ' = '
    if expression_value.respond_to?(:each) && !expression_value.is_a?(String)
      s << " \n"
      expression_value.each { |e| s << ' ' << e.inspect << " \n" }
    else
      s << expression_value.inspect << " \n"
    end
  else
    s << msg if msg
    s << " \n"
  end

  reverse_video_color_code = "\e[7m"
  reset_color_code = "\e[0m"
  
  s = reverse_video_color_code + s + reset_color_code
  s << 'lll: ' + caller.first.to_s + ' ' + Time.now.strftime('%X')

  Kernel.puts s
  Rails.logger.debug s if defined?(Rails) && Rails.logger
end
