require 'minitest/pride'
require 'minitest/autorun'
require './currency.rb'

class CurrencyTest < Minitest::Test

  def setup
    @a = Currency.new(amount: 34, code: 'USD')
    @b = Currency.new(amount: 34, code: 'USD')
    @c = Currency.new(amount: 34, code: 'EUR')
    @d = Currency.new(amount: 30, code: 'USD')
    @e = Currency.new(amount: 64, code: 'USD')
    @f = Currency.new(amount: 64, code: 'EUR')
    @g = Currency.new(amount: 4, code: 'USD')
    @h = Currency.new(amount: 4, code: 'EUR')
  end

  def test_currency_creation
    Currency.new(amount: 34, code: 'USD')
    Currency.new(amount: '$5')
    Currency.new(amount: 5, code: 'USD')
    Currency.new(amount: '€7.00')
  end

  def test_equal_currencies
    assert @a == @b
    refute @a == @c
    refute @a == @d
  end

  def test_add_currencies
    assert @a + @d == @e
    refute @a + @d == @f
    assert_raises DifferentCurrencyCodeError do
      @a + @c
    end
  end

  def test_subtract_currencies
    assert @a - @d == @g
    refute @a - @d == @h
    assert_raises DifferentCurrencyCodeError do
      @a - @c
    end
  end

  def test_multiply_currencies
    a = Currency.new(amount: 5, code: 'USD')
    b = Currency.new(amount: 10, code: 'USD')
    c = Currency.new(amount: 10, code: 'EUR')
    assert a * 2 === b
    assert a * 2.0 == b
    refute a * 2 == c
    refute a * 2.0 == c
  end
end
