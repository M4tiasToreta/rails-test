require "./app/services/calculator_service.rb"
require "./app/services/service_errors.rb"

RSpec.describe CalculatorService do
  describe "two integers" do 

    before do
      @x = '4'
      @y = '2'
    end

    it "added" do
      expect(CalculatorService.new("ADD #{@x}, #{@y}").execute).to eq(6)
    end

    it "subtracted bigger - smaller" do
      expect(CalculatorService.new("SUB #{@x}, #{@y}").execute).to eq(2)
    end

    it "subtracted smaller - bigger" do
      expect(CalculatorService.new("SUB #{@y}, #{@x}").execute).to eq(-2)
    end

    it "multipplied" do
      expect(CalculatorService.new("MUL #{@x}, #{@y}").execute).to eq(8)
    end

    it "divided bigger / smaller" do
      expect(CalculatorService.new("DIV #{@x}, #{@y}").execute).to eq(2)
    end

    it "divided smaller / bigger" do
      expect(CalculatorService.new("DIV #{@y}, #{@x}").execute).to eq(0.5)
    end
  end

  describe "two floats" do 
    before do
      @x = '2.5'
      @y = '1.5'
    end

    it "added" do
      expect(CalculatorService.new("ADD #{@x}, #{@y}").execute).to eq(4)
    end

    it "subtracted bigger - smaller" do
      expect(CalculatorService.new("SUB #{@x}, #{@y}").execute).to eq(1)
    end

    it "subtracted smaller - bigger" do
      expect(CalculatorService.new("SUB #{@y}, #{@x}").execute).to eq(-1)
    end

    it "multipplied" do
      expect(CalculatorService.new("MUL #{@x}, #{@y}").execute).to eq(3.75)
    end

    it "divided bigger / smaller" do
      expect(CalculatorService.new("DIV #{@x}, #{@y}").execute).to eq(1.67)
    end

    it "divided smaller / bigger" do
      expect(CalculatorService.new("DIV #{@y}, #{@x}").execute).to eq(0.6)
    end
  end

  describe "float and integer" do
    before do
      @x = '2'
      @y = '1.5'
    end

    it "added" do
      expect(CalculatorService.new("ADD #{@x}, #{@y}").execute).to eq(3.5)
    end

    it "subtracted bigger - smaller" do
      expect(CalculatorService.new("SUB #{@x}, #{@y}").execute).to eq(0.5)
    end

    it "subtracted smaller - bigger" do
      expect(CalculatorService.new("SUB #{@y}, #{@x}").execute).to eq(-0.5)
    end

    it "multipplied" do
      expect(CalculatorService.new("MUL #{@x}, #{@y}").execute).to eq(3)
    end

    it "divided bigger / smaller" do
      expect(CalculatorService.new("DIV #{@x}, #{@y}").execute).to eq(1.34)
    end

    it "divided smaller / bigger" do
      expect(CalculatorService.new("DIV #{@y}, #{@x}").execute).to eq(0.75)
    end
  end

  describe "negative numbers" do
    before do
      @x = '2'
      @y = '-1.5'
    end

    it "added" do
      expect(CalculatorService.new("ADD #{@x}, #{@y}").execute).to eq(0.5)
    end

    it "subtracted bigger - smaller" do
      expect(CalculatorService.new("SUB #{@x}, #{@y}").execute).to eq(3.5)
    end

    it "subtracted smaller - bigger" do
      expect(CalculatorService.new("SUB #{@y}, #{@x}").execute).to eq(-3.5)
    end

    it "multipplied" do
      expect(CalculatorService.new("MUL #{@x}, #{@y}").execute).to eq(-3)
    end

    it "divided bigger / smaller" do
      expect(CalculatorService.new("DIV #{@x}, #{@y}").execute).to eq(-1.33)
    end

    it "divided smaller / bigger" do
      expect(CalculatorService.new("DIV #{@y}, #{@x}").execute).to eq(-0.75)
    end
  end

  describe "error by" do
    it "numbers separated by comma" do
      x = "2,5"
      y = "1.5"
      expect { CalculatorService.new("DIV #{x}, #{y}").execute }.to raise_error(ServiceErrors::FloatSeparatedByComma, "Float number can't be separated by comma")
    end

    it "division by 0" do
      x = "2.5"
      y = "0"
      expect { CalculatorService.new("DIV #{x}, #{y}").execute }.to raise_error(ServiceErrors::DivisionByZero, "Can't divide by zero")
    end

    it "method does not exist" do
      x = "2.5"
      y = "3"
      expect { CalculatorService.new("BOLO #{x}, #{y}").execute }.to raise_error(ServiceErrors::CalculatorMethodDoesntExist, "Method bolo doesn't exist")
    end

    it "too many arguments" do
      x = "2.5"
      y = "3"
      expect { CalculatorService.new("BOLO #{x}, #{y}, #{y}").execute }.to raise_error(ServiceErrors::TooManyArguments, "Only 3 arguments supported")
    end
  end
end