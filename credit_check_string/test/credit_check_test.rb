require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'
require "pry"

class CreditCheckTest < Minitest::Test

  def test_class_exists_and_can_take_card_number
    credit_card_number = "5541808923795240"
    cc = CreditCheck.new(credit_card_number)
    assert_instance_of CreditCheck, cc
  end

  def test_can_split_card_numbers_to_array
    credit_card_number = "5541808923795240"
    cc = CreditCheck.new(credit_card_number)
    assert_instance_of CreditCheck, cc
  end

end
