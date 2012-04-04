sumDigits = sumDigits' 0

sumDigits' s 0 = s
sumDigits' s x = sumDigits' (s + (mod x 10)) (div x 10)

fac = fac' 1

fac' s 1 = s
fac' s x = fac' (s*x) (x-1)
