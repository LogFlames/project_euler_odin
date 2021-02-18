package main

import "core:fmt"

main :: proc() {
    a := 1;
    b := 0;
    sum := 0;
    c: int;

    for a < 4_000_000 {
        c = a;
        a += b;
        b = c;

        if a % 2 == 0 {
            sum += a;
        }
    }

    fmt.println(sum);
}