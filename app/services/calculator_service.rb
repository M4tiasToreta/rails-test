require "./app/services/service_errors.rb"

class CalculatorService

  include ServiceErrors

  def initialize(string_input)
    var_list = string_input.split ' '
    raise ServiceErrors::TooManyArguments if var_list.size != 3

    number_1 = var_list[1].chop
    raise FloatSeparatedByComma if number_1.include?(',')
    @number_1 = number_1.to_f

    @operation = var_list[0].downcase
    @number_2 = var_list[2].to_f
  end

  def execute
    raise ServiceErrors::CalculatorMethodDoesntExist.new(@operation) if !implemented_methods.include?(@operation)

    send @operation
  end

  private

  def implemented_methods
    ['add', 'sub', 'mul', 'div']
  end

  def add
    @number_1 + @number_2
  end

  def sub
    @number_1 - @number_2
  end

  def div
    raise ServiceErrors::DivisionByZero if @number_2.zero?

    result = @number_1 / @number_2
    result.ceil(2)
  end

  def mul
    @number_1 * @number_2
  end
end