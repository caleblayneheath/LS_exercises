require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction.rb'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    io = StringIO.new('30')
    transaction.prompt_for_payment(input: input)
    assert_equal(30, transaction.amount_paid)

    # expected_output = 'That is not the correct amount. \nPlease make sure to pay the full cost.\n'
    # io = StringIO.new('2\n')
    # assert_output(expected_output) { transaction.prompt_for_payment(input:io)}
  end
  
end