require "pry"

class CreditCheck
  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def split_card_number
    split_string = card_int_to_string(card_number).split("")
    string_nums_to_integers(split_string)
  end

  def string_nums_to_integers(arg)
    to_integer = []
    arg.each do |num|
      to_integer << num.to_i
    end
    to_integer
  end

  def card_int_to_string(arg)
    arg.to_s
  end

  def double_every_other
    split_card_number.map.with_index do |num, i|
      if i.even?
        (num * 2)
      else
        num
      end
    end
  end

  def two_digit_elements_to_one_digit_elements_in_array
    double_every_other.map do |num|
      if num.to_s.length == 2
        reduce_number(num)
      else
        num
      end
    end
  end

  def two_char_string_to_integer(ary)
    ary.map
  end

  def reduce_number(num)
    split = num.to_s.split("")
    split[0].to_i + split[1].to_i
  end

  def sum_of_number_array
    two_digit_elements_to_one_digit_elements_in_array.inject(:+)
  end

  def valid?
    if sum_of_number_array % 10 == 0
      binding.pry
      "Card is Valid"
    else
      "Card is Invalid"
    end
  end
end

cc1 = CreditCheck.new(5541808923795240)
puts "CC Number 5541808923795240 - #{cc1.valid?}"

cc2 = CreditCheck.new(5541801923795240)
puts puts "CC Number 5541801923795240 - #{cc2.valid?}"
