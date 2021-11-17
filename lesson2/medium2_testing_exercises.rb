# medium2_testing_exercises.rb

# require 'simplecov'
# SimpleCov.start
# require "minitest/reporters"
# Minitest::Reporters.use!

require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test

  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(20)
    @transaction.amount_paid = 50
  end
  
  def test_accept_money
    @register.accept_money(@transaction)
    assert_equal(1050, @register.total_money)
  end
  
  def test_change
    assert_equal(30, @register.change(@transaction))
  end
  
  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") do
      @register.give_receipt(@transaction) 
    end
  end
  
  def test_prompt_for_payment
    input = StringIO.new("30\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(30, @transaction.amount_paid)
  end
end
  
