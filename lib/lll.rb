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

  color_code_for_value = "\e[7m"
  color_code_for_location = ""
  stop_color_code = "\e[0m"

  s = color_code_for_value + s + stop_color_code
  s << color_code_for_location + ' ' + caller.first.to_s + ' ' + Time.now.strftime('%X') + ' ' + stop_color_code

  Kernel.puts s
  Rails.logger.debug s if defined?(Rails) && Rails.logger
end
