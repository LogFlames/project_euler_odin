package main

import "core:fmt"
import "core:math"
import "core:strconv"

ds := calcualte_powers();

main :: proc() {
    largest: int;
    prod: int = ---;

    for i in 100..999 {
        for j in i..999 {
            prod = i * j;
            if is_palindrome_int(prod) {
                if prod > largest {
                    largest = prod;
                }
            }
        }
    }

    fmt.println(largest);
}

is_palindrome_int :: proc(x: int) -> bool {
    digs : int = ---;

    switch x {
        case 0..<10:
            digs = 0;
        case 10..<100:
            digs = 1;
        case 100..<1000:
            digs = 2;
        case 1000..<10000:
            digs = 3;
        case 10000..<100000:
            digs = 4;
        case 100000..<1000000:
            digs = 5;
        case:
            digs = int(math.log10(f64(x)));
    }

    for p in 1..(digs + 1) / 2 {
        d0 := ds[p - 1];
        d1 := ds[digs - p + 1];

        r := (x / d0) % 10;
        l := (x / d1) % 10;

        if l != r {
            return false;
        }
    }

    return true;
}

calcualte_powers :: proc() -> [10]int {
    ds: [10]int;
    for p in 0..9 {
        ds[p] = int(math.pow(10.0, f64(p)));
    }

    return ds;
}

is_palindrome :: proc(x: int) -> bool {
    buf: [10]byte;
    x_str := strconv.itoa(buf[:], x);
    x_str_len := len(x_str);

    for i in 0..<(x_str_len / 2) {
        if x_str[i] != x_str[x_str_len - i - 1] {
            return false;
        }
    }

    return true;
}