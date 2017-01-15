class Currency
  attr_reader :amount, :code
  def initialize(amount:, code:)
    @amount = amount
    @code = code
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
end
