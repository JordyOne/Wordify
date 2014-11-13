class Converter
  def self.convert(number)
    num_string = number.split('')
    word_string = []
    num_string.each_with_index do |digit, index|
      if (num_string.length - index) == 2
        word_string << TENS[digit.to_i]
      else
        if index == num_string.length
          word_string << NUMBER[digit.to_i]
        else
          word_string << "#{NUMBER[digit.to_i]} #{DESCRIPTIONS[num_string.length - index]}"
        end
      end
    end
    word_string.join(' ')
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
      4 => "Fourty",
      5 => "Fifty",
      6 => "Sixty",
      7 => "Seventy",
      8 => "Eighty",
      9 => "Ninty"
  }

  DESCRIPTIONS = {
      3 => "Hundred", #100
      4 => "Thousand", #1000
      7 => "Million", #1000000
  }


  # I left these here to let you see a little bit of my process
  def self.convert_single
    NUMBER[@number]
  end

  def self.convert_tens
    num_string = @number.to_s
    ten_digit = TENS[num_string[0].to_i]
    single_digit = NUMBER[num_string[1].to_i]
    [ten_digit, single_digit].join(' ')
  end

  def self.convert_hundreds
    num_string = @number.to_s
    hundred_digit = NUMBER[num_string[0].to_i]
    description = DESCRIPTIONS[num_string.length]
    tens_digit = TENS[num_string[1].to_i]
    single_digit = NUMBER[num_string[2].to_i]
    "#{hundred_digit} #{description} and #{tens_digit} #{single_digit}"
  end

  def inject_and(arr)
    # if index is one of the last two
        # store the data and move them down
        # inject 'and' string at the third to last position so that the join will appear properly.
  end


end