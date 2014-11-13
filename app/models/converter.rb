class Converter
  def self.convert(number)
    formatted_number = format_number(number)
    final_num_arr = []
    if formatted_number.include?('.')
      num_arr = formatted_number.split('.')
      final_num_arr << before_decimal(num_arr[0])
      final_num_arr << after_decimal(num_arr[1])
    else
      final_num_arr << before_decimal(formatted_number)
    end
    final_num_arr.join(' ')
  end

  private

  NUMBER = {
      1 => "One",
      2 => "Two",
      3 => "Three",
      4 => "Four",
      5 => "Five",
      6 => "Six",
      7 => "Seven",
      8 => "Eight",
      9 => "Nine",
      10 => "Ten",
      11 => "Eleven",
      12 => "Twelve",
      13 => "Thirteen",
      14 => "Fourteen",
      15 => "Fifteen",
      16 => "Sixteen",
      17 => "Seventeen",
      18 => "Eighteen",
      19 => "Nineteen"
  }

  TENS = {
      2 => "Twenty",
      3 => "Thirty",
      4 => "Forty",
      5 => "Fifty",
      6 => "Sixty",
      7 => "Seventy",
      8 => "Eighty",
      9 => "Ninty"
  }

  DESCRIPTIONS = {
      2 => "Thousand", #1000
      3 => "Million", #1000000
      4 => "Billion", #1000000
      5 => "Tillion", #1000000
      6 => "Quadrillion", #1000000

  }

  def self.split_on_decimal(number)
    number.split('.')
  end

  def self.after_decimal(number)
    cents = number[0..1]
    "and #{cents}/100"
  end

  def self.before_decimal(number)
    num_arr = number.split('')
    arr_of_threes = self.slice_num_arr(num_arr)
    word_string = []

    arr_of_threes.each_with_index do |arr, index|
      word_string << create_substring(arr)
      description_index = arr_of_threes.length - index
      if description_index != 0
        word_string << DESCRIPTIONS[description_index]
      end
    end
    word_string.join(' ')
  end

  def self.format_number(number)
    number.gsub(/[^\d\.]/, '')
  end

  def self.slice_num_arr(number)
    number.each_slice(3).to_a
  end

  def self.create_substring(num_string_arr)
    sub_string = []
    if num_string_arr.length == 3
      num_string_arr.each_with_index do |digit, index|
        if index == 1
          if digit == '1'
            puts [digit, num_string_arr[-1]].join('').to_i
            puts NUMBER[[digit, num_string_arr[-1]].join('').to_i]
            sub_string << NUMBER[[digit, num_string_arr[-1]].join('').to_i]
            break
          end
          sub_string << TENS[digit.to_i]
        elsif index == 2
          sub_string << NUMBER[digit.to_i]
        else
          sub_string << "#{NUMBER[digit.to_i]} Hundred"
        end
      end
    elsif num_string_arr.length == 2
      if num_string_arr[0] == '1'
        irregular_number = num_string_arr.join('')
        NUMBER[irregular_number.to_i]
      else
        num_string_arr.each_with_index do |digit, index|
          if index == 0
            sub_string << TENS[digit.to_i]
          else
            sub_string << NUMBER[digit.to_i]
          end
        end
      end
    else
      sub_string << NUMBER[num_string_arr[0].to_i]
    end
    sub_string
  end
end