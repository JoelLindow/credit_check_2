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

  def test_if_every_other_number_doubled
    credit_card_number = "5541808923795240"
    cc = CreditCheck.new(credit_card_number)
    split_card_with_doubles = ["10", "5", "8", "1", "16", "0", "16", "9",
                               "4", "3", "14", "9", "10", "2", "8", "0"]
    assert_equal split_card_with_doubles, cc.double_every_other_number
  end

  def test_it_can_reduce_two_digit_numbers_properly
    credit_card_number = "5541808923795240"
    cc = CreditCheck.new(credit_card_number)
    split_card_with_reductions = ["1", "5", "8", "1", "7", "0", "7", "9",
                                  "4", "3", "5", "9", "1", "2", "8", "0"]
    assert_equal split_card_with_reductions, cc.split_card_with_reductions
  end

  def test_it_can_add_up_the_array_elements_to_a_single_number
    credit_card_number = "5541808923795240"
    cc = CreditCheck.new(credit_card_number)
    assert_equal 70, cc.sum_of_final_collection
  end

  def test_it_can_identify_a_valid_number
    credit_card_number = "5541808923795240"
    cc = CreditCheck.new(credit_card_number)
    assert cc.validate

    credit_card_number = "4024007136512380"
    cc = CreditCheck.new(credit_card_number)
    assert cc.validate

    credit_card_number = "6011797668867828"
    cc = CreditCheck.new(credit_card_number)
    assert cc.validate
  end

  def test_it_can_recognize_an_invalid_card
    credit_card_number = "5541801923795240"
    cc = CreditCheck.new(credit_card_number)
    refute cc.validate

    credit_card_number = "4024007106512380"
    cc = CreditCheck.new(credit_card_number)
    refute cc.validate

    credit_card_number = "6011797668868728"
    cc = CreditCheck.new(credit_card_number)
    refute cc.validate
  end

  def test_it_returns_proper_output_message_for_validation
    credit_card_number = "5541808923795240"
    cc = CreditCheck.new(credit_card_number)
    good = "Card Number #{credit_card_number} is a Valid Credit Card Number"
    assert_equal good, cc.validation_message_output

    credit_card_number = "5541801923795240"
    cc = CreditCheck.new(credit_card_number)
    bad = "Card Number #{credit_card_number} is not a Valid Card Number. Call the Cops!"
    assert_equal bad, cc.validation_message_output
  end


end
