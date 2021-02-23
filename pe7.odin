package main

import "core:fmt"
import "primes"

main :: proc() {
    prims := primes.generate_n_primes(10001);

    fmt.println(prims[len(prims) - 1]);
}

