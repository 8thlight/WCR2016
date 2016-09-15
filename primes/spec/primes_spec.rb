require 'rspec'
require 'primes'

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
# we can see that the 6th prime is 13.
# What is the 10 001st prime number?

describe Primes do
  context 'nthPrime' do
    it 'says the first prime is 2' do
      expect(Primes.nthPrime(1)).to eq(2)
    end
  
    it 'says the second prime is 3' do
      expect(Primes.nthPrime(2)).to eq(3)
    end
    
    it 'says the six prime is 13' do
      expect(Primes.nthPrime(6)).to eq(13)
    end
    
    it 'says the 10_001 prime is 104_743' do
      expect(Primes.nthPrime(10_001)).to eq(104_743)
    end
  end
  
  context 'isPrime' do
    it 'should say that 2 is prime' do
      expect(Primes.isPrime(2)).to eq(true)
    end
    
    it 'should say that 3 is prime' do
      expect(Primes.isPrime(3)).to eq(true)
    end
    
    it 'should say that 4 is not prime' do
      expect(Primes.isPrime(4)).to eq(false)
    end
    
    it 'should say that 5 is prime' do
      expect(Primes.isPrime(5)).to eq(true)
    end
  end
end
