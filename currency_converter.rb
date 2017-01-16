require './currency.rb'

class CurrencyConverter
  attr_reader :USD, :EUR, :GBP, :curr_rates
  def initialize(**_)
    @USD = _[:USD]
    @EUR = _[:EUR]
    @GBP = _[:GBP]
    @curr_rates = {'USD'=>@USD, 'EUR'=>@EUR, 'GBP'=>@GBP}
  end

  def convert(a,b)
    raise RuntimeError.new('Unknown Currency Code Error') unless curr_rates[a.code] != nil && curr_rates[b] != nil
      if a.code == b
        Currency.new(amount: a.amount, code: a.code)
      elsif curr_rates[a.code] > curr_rates[b]
        Currency.new(amount: a.amount * curr_rates[b], code: b)
      else
        Currency.new(amount: a.amount / curr_rates[a.code], code: b)
      end
  end
end
