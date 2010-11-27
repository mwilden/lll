# Used in debugging to display an expression and its value. Examples:
#   x = 1
#   lll{'x'} #=> x = 1
#   lll("a message"){'x'} #=> a message: x = 1
#   lll "a message" #=> a message
# Enumerable members are output on separate lines

def lll msg = nil, &block
  Lll.lll msg, block
end

module Lll
  def self.lll msg, block = nil
    output_string = " "
    expression_value = 0
    if block
      output_string << msg + ': ' if msg
      expression_string = block.call
      expression_value = eval(expression_string, block)
      output_string << expression_string + ' = '
      if expression_value.respond_to?(:each) && !expression_value.is_a?(String) && !expression_value.is_a?(Nokogiri::HTML::Document)
        output_string << " \n"
        expression_value.each { |e| output_string << ' ' << e.inspect << " \n" }
      else
        output_string << expression_value.inspect << " \n"
      end
    else
      output_string << msg if msg
      output_string << " \n"
    end

    Kernel.puts format(output_string, ENV['TERM'] != 'dumb')
    Rails.logger.debug(format(output_string)) if defined?(Rails) && Rails.logger

    expression_value
  end

  def self.format output_string, colorize = true
    string = output_string
    string =  "\e[7m" + string + "\e[0m" if colorize
    string + "lll: #{caller[2].to_s} #{Time.now.strftime('%X')}"
  end
end
