# ROMAN NUMERALS
# CHALLENGE DESCRIPTION:
#
#
# Many persons are familiar with the Roman numerals for relatively small numbers. The symbols I (capital i), V, X, L, C, D, and M represent the decimal values 1, 5, 10, 50, 100, 500 and 1000 respectively. To represent other values, these symbols, and multiples where necessary, are concatenated, with the smaller-valued symbols written further to the right. For example, the number 3 is represented as III, and the value 73 is represented as LXXIII. The exceptions to this rule occur for numbers having units values of 4 or 9, and for tens values of 40 or 90. For these cases, the Roman numeral representations are IV (4), IX (9), XL (40), and XC (90). So the Roman numeral representations for 24, 39, 44, 49, and 94 are XXIV, XXXIX, XLIV, XLIX, and XCIV, respectively.
#
# Write a program to convert a cardinal number to a Roman numeral.
#
# INPUT SAMPLE:
#
# Your program should accept as its first argument a path to a filename. Input example is the following
#
# 159
# 296
# 3992
# Input numbers are in range [1, 3999]
#
# OUTPUT SAMPLE:
#
# Print out Roman numerals.
#
# CLIX
# CCXCVI
# MMMCMXCII

ROMANS = {
 1000 => "M",
 500 => "D",
 100 => "C",
 50 => "L",
 10 => "X",
 5 => "V",
 1 => "I" 
}

def romanize(num)
  roman_numeral = ""
  if num / 1000 > 0
    ms = num / 1000
    ms.times {roman_numeral << "M"}
    num -= ms * 1000
  end
  
  if num / 900 == 1
    roman_numeral << "CM"
    num -= 900
  elsif num / 500 == 1
    roman_numeral << "D"
    num -= 500
  elsif num / 400 == 1
    roman_numeral << "CD"
    num -= 400
  end
  
  if num / 100 > 0
    cs = num / 100
    cs.times {roman_numeral << "C"}
    num -= cs * 100
  end
  
  if num / 90 == 1
    roman_numeral << "XC"
    num -= 90
  elsif num / 50 == 1
    roman_numeral << "L"
    num -= 50
  elsif num / 40 == 1
    roman_numeral << "XL"
    num -= 40
  end
  
  if num / 10 > 0
    xs = num / 10
    xs.times {roman_numeral << "X"}
    num -= xs * 10
  end
  
  if num / 9 == 1
    roman_numeral << "IX"
    num -= 9
  elsif num / 5 == 1
    roman_numeral << "V"
    num -= 5
  elsif num / 4 == 1
    roman_numeral << "IV"
    num -= 4
  end
  
  if num > 0
    num.times {roman_numeral << "I"}
    num = 0
  end
  
  p num
  return roman_numeral
end

p romanize(3992)