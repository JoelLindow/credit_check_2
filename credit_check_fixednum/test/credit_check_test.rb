require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'
require "pry"

class CreditCheckTest < Minitest::Test

  def test_class_exists_and_can_take_card_number
    credit_card_number = 5541808923795240
    cc = CreditCheck.new(credit_card_number)
    assert_instance_of CreditCheck, cc
  end

  def test_can_split_up_card_number_into_array
    credit_card_number = 5541808923795240
    cc = CreditCheck.new(credit_card_number)
    split_card = [5, 5, 4, 1, 8, 0, 8, 9, 2, 3, 7, 9, 5, 2, 4, 0]
    assert_equal split_card, cc.split_card_number
  end

  def test_if_every_other_number_doubled
    credit_card_number = 5541808923795240
    cc = CreditCheck.new(credit_card_number)
    split_card_with_doubles = [10, 5, 8, 1, 16, 0, 16, 9, 4, 3, 14, 9, 10, 2, 8, 0]
    assert_equal split_card_with_doubles, cc.double_every_other
  end

  def test_two_digit_elements_can_be_added_into_sum_element
    credit_card_number = 5541808923795240
    cc = CreditCheck.new(credit_card_number)
    split_card_with_doubles = [1, 5, 8, 1, 7, 0, 7, 9, 4, 3, 5, 9, 1, 2, 8, 0]
    assert_equal split_card_with_doubles, cc.two_digit_elements_to_one_digit_elements_in_array
  end

  def test_it_can_add_all_array_elements_to_get_a_sum
    credit_card_number = 5541808923795240
    cc = CreditCheck.new(credit_card_number)
    assert_equal 70, cc.sum_of_number_array
  end

  def test_if_card_is_valid
    credit_card_number = 5541808923795240
    cc = CreditCheck.new(credit_card_number)
    assert_equal "Card is Valid", cc.valid?
  end

  def test_it_can_recognize_an_invalid_card
    credit_card_number = 5541801923795240
    cc = CreditCheck.new(credit_card_number)
    assert_equal "Card is Invalid", cc.valid?
  end

end
