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
    c = Currency.new(amount: 34, code: 'EUR')
    assert a == b
    refute a == c

    d = Currency.new(amount: 30, code: 'USD')
    refute a == d
  end

  def test_add_currencies
    a = Currency.new(amount: 34, code: 'USD')
    b = Currency.new(amount: 30, code: 'USD')
    c = Currency.new(amount: 34, code: 'EUR')
    d = Currency.new(amount: 64, code: 'USD')
    assert a + b == d
    assert_raises RuntimeError do
      a + c
    end
  end

  def test_subtract_currencies
    a = Currency.new(amount: 34, code: 'USD')
    b = Currency.new(amount: 30, code: 'USD')
    c = Currency.new(amount: 34, code: 'EUR')
    d = Currency.new(amount: 4, code: 'USD')
    assert a - b == d
    assert_raises RuntimeError do
      a - c
    end
  end

  def test_multiply_currencies
    a = Currency.new(amount: 5, code: 'USD')
    b = Currency.new(amount: 10, code: 'USD')
    assert a * 2 === b
    assert a * 2.0 == b
  end
end
