class DifferentCurrencyCodeError < StandardError
end

class Currency
  attr_reader :amount, :code
  def initialize(amount:, code: nil)
    symbols = {"$"=>'USD', "€"=>'EUR', "£"=>'GBP'}
    if code
      @code = code
      @amount = amount
    else
      @code = symbols[amount[0]]
      @amount = amount[1..-1].to_f
    end
  end

  def ==(other)
    @amount == other.amount && @code == other.code
  end

  def +(other)
    raise DifferentCurrencyCodeError.new("These currencies don't have the same currency code") unless @code == other.code
    Currency.new(amount: @amount + other.amount, code: @code)
  end

  def -(other)
    raise DifferentCurrencyCodeError.new("These currencies don't have the same currency code") unless @code == other.code
    Currency.new(amount: @amount - other.amount, code: @code)
  end

  def *(value)
    Currency.new(amount: @amount * value, code: @code)
  end
end

a = Currency.new(amount: 34, code: 'USD')
b = Currency.new(amount: 34, code: 'USD')
c = Currency.new(amount: 34, code: 'EUR')
d = Currency.new(amount: 30, code: 'USD')
