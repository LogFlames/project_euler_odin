package primes

import "core:math"

generate_primes :: proc(n: int) -> [dynamic]int {
    upperLimit : int = int(math.sqrt_f64(f64(n)));
    potPrimesCount : int = (n - 1) / 2;
    potPrimes := make([dynamic]int, potPrimesCount, potPrimesCount);

    for i in 0..<potPrimesCount {
        potPrimes[i] = i * 2 + 3;
    }

    for i in 0..<potPrimesCount {
        if potPrimes[i] == -1 {
            continue;
        }

        if potPrimes[i] > upperLimit {
            break;
        }

        for j := i + potPrimes[i]; j < potPrimesCount; j += potPrimes[i] {
            potPrimes[j] = -1;
        }
    }

    primes: [dynamic]int = {2};

    for pp in potPrimes {
        if pp != -1 {
            append(&primes, pp);
        }
    }

    return primes;
}

generate_n_primes :: proc(n: int) -> [dynamic]int {
    primes := make([dynamic]int, 0, n);
    append(&primes, 2);

    primeInd := 1;
    testPrime := 3;
    for primeInd < n {
        isPrime := true;
        for prevPrime in primes {
            if testPrime % prevPrime == 0 {
                isPrime = false;
                break;
            }
        }

        if isPrime {
            append(&primes, testPrime);
            primeInd += 1;
        }

        testPrime += 2;
    }

    return primes;
}
