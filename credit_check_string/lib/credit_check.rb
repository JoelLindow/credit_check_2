require "pry"
class CreditCheck
attr_reader :card

  def initialize(card)
    @card = card

  end

  def split_card_number
    card.split("")
  end

  def double_every_other_number
    split_card_number.map.with_index do |num, ind|
      if ind.even?
        (num.to_i * 2).to_s
      else
        num
      end
    end
  end

  def split_card_with_reductions
    double_every_other_number.map do |num|
      if num.length >= 2
        reduce_two_digit_number(num)
      else
        num
      end
    end
  end

  def reduce_two_digit_number(number)
    split_up = number.split("")
    split_string = split_up.map do |num|
      num.to_i
    end
    split_string.inject(:+).to_s
  end

  
end
