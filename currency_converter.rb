require './currency.rb'

class UnknownCurrencyCodeError < StandardError
end

class CurrencyConverter
  attr_reader :rates
  def initialize(rates)
    @rates = rates.collect{|k,v| [k.to_s, v]}.to_h
  end

  def convert(obj, code)
    raise UnknownCurrencyCodeError.new('That currency code is unknown') unless rates[obj.code] != nil && rates[code] != nil
    if obj.code == code
      Currency.new(amount: obj.amount, code: obj.code)
    else
      Currency.new(amount: (obj.amount * rates[code]) / rates[obj.code], code: code)
    end
  end
end
