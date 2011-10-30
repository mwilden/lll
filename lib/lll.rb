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
    using_dumb_terminal = ENV['TERM'] == 'dumb'
    output_string = " "
    expression_value = 0
    if block
      output_string << msg + ': ' if msg
      expression_string = block.call
      expression_value = eval(expression_string, block.binding)
      output_string << expression_string + ' = '
      if defined?(AwesomePrint) && !using_dumb_terminal
        output_string << expression_value.awesome_inspect << " \n"
      elsif enumerable? expression_value
        output_string << " \n"
        expression_value.each { |e| output_string << ' ' << e.inspect << " \n" }
      else
        output_string << expression_value.inspect << " \n"
      end
    else
      output_string << msg if msg
      output_string << " \n"
    end

    $stderr.puts format(output_string, !using_dumb_terminal)
    Rails.logger.debug(format(output_string)) if defined?(Rails) && Rails.logger

    expression_value
  end

  def self.format output_string, colorize = true
    string = output_string
    string =  "\e[7m" + string + "\e[0m" if colorize
    string + "lll: #{caller[2].to_s} #{Time.now.strftime('%X')}"
  end

  def self.enumerable? value
    value.respond_to?(:each) &&
    !value.is_a?(String) &&
    (!defined? Nokogiri ||
     (!value.is_a?(Nokogiri::HTML::Document) &&
      !value.is_a?(Nokogiri::XML::Element)))
  end
end
