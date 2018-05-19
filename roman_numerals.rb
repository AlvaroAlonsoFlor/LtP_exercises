#Write a method that when passed an integer between 1 and 3000 returns a string
# containing the proper old school roman numeral

#puts "Write the number you want to transform into an old roman number?"
#answer = gets.chomp.to_i



#book solution
def old_roman_numeral num
  roman =''
  roman = roman + 'M' * (num / 1000)
  roman = roman + 'D' * (num % 1000 / 500)
  roman = roman + 'C' * (num % 500 / 100)
  roman = roman + 'L' * (num % 100 / 50)
  roman = roman + 'X' * (num % 50 / 10)
  roman = roman + 'V' * (num % 10 / 5)
  roman = roman + 'I' * (num % 5 / 1)
  roman
end

#here finishes the book solution

def roman_old_numeral (number)
  final_number = ""
  final_number += "M" * (number / 1000)
  final_number += "D" * (number % 1000 / 500)
  final_number += "C" * (number % 500 / 100)
  final_number += "L" * (number % 100 / 50)
  final_number += "X" * (number % 50 / 10)
  final_number += "V" * (number % 10 / 5)
  final_number += 'I' * (number % 5 / 1)
  puts final_number
end


def roman_new_numeral(num)

  thousands = num / 1000
  modern_numeral = "M" * thousands

  hundreds = num % 1000 / 100

  if hundreds == 9
    modern_numeral += "CM"
  elsif hundreds == 4
    modern_numeral += "CD"
  else
    modern_numeral += "D" * (num % 1000 / 500)
    modern_numeral += "C" * (num % 500 / 100)
  end

  tens = num % 100 / 10

  if tens == 9
    modern_numeral += "XC"
  elsif tens == 4
    modern_numeral += "XL"
  else
    modern_numeral += "L" * (num % 100 / 50)
    modern_numeral += "X" * (num % 50 / 10)
  end

  units = num % 10

  if units == 9
    modern_numeral += "IX"
  elsif units == 4
    modern_numeral += "IV"
  else
    modern_numeral += "I" * (num % 10)
  end

  return modern_numeral

end


def roman_arrays (num)
  rom_num = ""
  rom = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  dec = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

  dec.length.times do |x|
    while dec[x] <= num
      rom_num += rom[x]
      num -= dec[x]
    end
  end
  return rom_num
end


#figure out methods for hash
def roman_hash(num)
  roman_num = ""
  numerals = {
    "M": 1000,
    "CM": 900,
    "D": 500,
    "CD": 400,
    "C": 100,
    "XC": 90,
    "L": 50,
    "XL": 40,
    "X": 10,
    "IX": 9,
    "V": 5,
    "IV": 4,
    "I": 1
  }

  numerals.each do | roman, decimal |
    while decimal <= num
      roman_num += roman.to_s
      num -= decimal
    end
  end
  return roman_num

end

puts roman_hash(19)
puts roman_hash(1917)
puts roman_hash(2018)
puts roman_hash(146)
