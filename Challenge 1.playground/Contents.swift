func fizzbuzz(n: Int) -> String {
  if n % 3 == 0 && n % 5 == 0 {
    return "Fizzz Buzz"
  } else if n % 3 == 0 {
    return "Fizz"
  } else if n % 5 == 0 {
    return "Buzz"
  } else {
    return "\(n)"
  }
}


// Test Cases
fizzbuzz(n: 3)
fizzbuzz(n: 5)
fizzbuzz(n: 15)
fizzbuzz(n: 16)
