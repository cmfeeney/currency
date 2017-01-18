require './currency.rb'

class CurrencyConverter
  attr_reader :USD, :EUR, :GBP, :curr_rates
  def initialize(**_)
    @USD = _[:USD]
    @EUR = _[:EUR]
    @GBP = _[:GBP]
    @curr_rates = {'USD'=>@USD, 'EUR'=>@EUR, 'GBP'=>@GBP}
  end

  def convert(a, code)
    raise RuntimeError.new('Unknown Currency Code Error') unless curr_rates[a.code] != nil && curr_rates[code] != nil
    if a.code == code
      Currency.new(amount: a.amount, code: a.code)
    elsif curr_rates[a.code] > curr_rates[code]
      Currency.new(amount: a.amount * curr_rates[code], code: code)
    else
      Currency.new(amount: a.amount / curr_rates[a.code], code: code)
    end
  end
end
