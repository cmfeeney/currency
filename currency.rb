class Currency
  attr_reader :amount, :code
  def initialize(amount:, code:)
    @amount = amount
    @code = code
  end

  def ==(other)

  end
end
