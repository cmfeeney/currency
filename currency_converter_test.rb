require 'minitest/pride'
require 'minitest/autorun'
require './currency_converter.rb'

class CurrencyConverterTest < Minitest::Test
  def test_currency_converter_creation
    CurrencyConverter.new(USD: 1.0, EUR: 0.943585)
    CurrencyConverter.new(USD: 1.0, EUR: 0.943585, GBP: 0.830174)
  end

  def test_conversion
    a = CurrencyConverter.new(USD: 1.0, EUR: 0.943585, GBP: 0.830174)
    b = Currency.new(amount: '$1')
    c = Currency.new(amount: 1, code: 'EUR')
    d = Currency.new(amount: 0.943585, code: 'EUR')
    e = Currency.new(amount: 0.830174, code: 'GBP')
    f = Currency.new(amount: 1, code: 'USD')
    assert a.convert(b, 'USD') == b
    assert a.convert(c, 'EUR') == c
    assert a.convert(b, 'EUR') == d
    assert a.convert(f, 'GBP') == e
  end
end
