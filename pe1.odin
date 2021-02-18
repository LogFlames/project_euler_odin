package main

import "core:fmt"

main :: proc() {
    count := 0;

    for i := 0; i <= 1000; i += 1 {
        if i % 3 == 0 || i % 5 == 0 {
            count += i;
        }
    }

    fmt.println(count);
}
