module ServiceErrors
  class TooManyArguments < StandardError #ok
    def message
      "Only 3 arguments supported"
    end
  end

  class DivisionByZero < StandardError #ok
    def message
      "Can't divide by zero"
    end
  end

  class CalculatorMethodDoesntExist < StandardError # ok
    def initialize(method_name)
      @method_name = method_name
    end

    def message
      "Method #{@method_name} doesn't exist"
    end
  end

  class FloatSeparatedByComma < StandardError
    def message
      "Float number can't be separated by comma"
    end
  end
end