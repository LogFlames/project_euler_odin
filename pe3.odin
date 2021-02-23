package main

import "core:fmt"
import "core:math"
import "primes"

main :: proc() {
    num : int = 600851475143;
    numSqrt : int = int(math.sqrt_f64(f64(num)));
    primes := primes.generate_primes(numSqrt);

    for p in primes {
        for num % p == 0 {
            num /= p;
        }

        if num == 1 {
            num = p;
            break;
        }
    }

    fmt.println(num);
}