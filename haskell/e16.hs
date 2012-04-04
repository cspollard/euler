sumDigits = sumDigits' 0

sumDigits' s 0 = s
sumDigits' s x = sumDigits' (s + (mod x 10)) (div x 10)
