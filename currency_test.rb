require 'minitest/pride'
require 'minitest/autorun'
require './currency.rb'

class CurrencyTest < Minitest::Test
  def test_currency_creation
    Currency.new(amount: 34, code: 'USD')
  end

  def test_equal_currencies
    a = Currency.new(amount: 34, code: 'USD')
    b = Currency.new(amount: 34, code: 'USD')
    assert a == b

    c = Currency.new(amount: 34, code: 'EUR')
    refute a == c

    d = Currency.new(amount: 30, code: 'USD')
    refute a == d
  end

  def test_add_currencies
    a = Currency.new(amount: 34, code: 'USD')
    b = Currency.new(amount: 30, code: 'USD')
    c = Currency.new(amount: 64, code: 'USD')
    assert a + b == c

    d = Currency.new(amount: 34, code: 'EUR')
    assert_raises RuntimeError do
      a + d
    end
  end
end
