package main

import "core:fmt"

main :: proc() {
    square_sum := 0;
    sum := 0;

    for i in 1..100 {
        square_sum += i * i;
        sum += i;
    }

    difference := sum * sum - square_sum;

    fmt.println(difference);

}
