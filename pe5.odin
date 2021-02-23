package main

import "core:fmt"

main :: proc() {

    prod := 1;

    for i in 1..20 {
        prod = lcm(prod, i);
    }

    fmt.println(prod);  
}

lcm :: proc(a, b: int) -> int {
    return abs(a * b) / gcd(a, b);
}

gcd :: proc(n1, n2: int) -> int {
    a, b := n1, n2;
    c : int = ---;
    
    for b != 0 {
        c = a % b;
        a = b;
        b = c;
    }

    return a;
}