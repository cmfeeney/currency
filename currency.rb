class Currency
  attr_reader :amount, :code
  def initialize(amount:, **_)
    symbols = {"$"=>'USD', "€"=>'EUR', "£"=>'GBP'}
    @amount = amount
    @code = _[:code]
    if @code == nil
      @code = symbols[@amount[0]]
      @amount = amount[1..-1].to_i
    end
  end

  def ==(other)
    @amount == other.amount && @code == other.code
  end

  def +(other)
    raise RuntimeError.new('Different Currency Code Error') unless @code == other.code
      Currency.new(amount: @amount + other.amount, code: @code)
  end

  def -(other)
    raise RuntimeError.new('Different Currency Code Error') unless @code == other.code
      Currency.new(amount: @amount - other.amount, code: @code)
  end

  def *(other)
    Currency.new(amount: @amount * other, code: @code)
  end
end
