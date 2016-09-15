class Primes
  def self.nthPrime(n)
    found_prime = 0
    index = 2
    last_prime = nil
    while(found_prime < n)
      if isPrime(index)
        found_prime += 1
        last_prime = index
      end
      index += 1
    end
    last_prime
  end
  
  def self.isPrime(i)
    c = Math.sqrt(i).floor
    (2..c).each do |j|
      return false if i % j == 0
    end
    return true
  end
end