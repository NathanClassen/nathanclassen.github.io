---
title: "CaseInPointers"
date: 2024-02-16T16:07:43-06:00
draft: true
---

Here is a function that uses recursion to calculate the nth number in the Fibonacci sequence:

```go
package main

func Fib(n int) int {
	return fastFib(n, map[int]int{1:0,2:1})
}

func fastFib(n int, ns map[int]int) int {
	if fibo, found := ns[n]; found {
		return fibo
	}
	ns[n-2] = fastFib(n-2, ns)
	ns[n-1] = fastFib(n-1, ns)


	return ns[n-2] + ns[n-1]
}
```

This is a classic dynamic-programming example where, rather than calculating fibonacci for the same values over and over as we recurse into the abyss, we pass along a map (hash, dictionary, etc) which will store previously calculated values, and subsequent calls to `Fib(previouslySeenValue)` will simply return the answer from the map.

The brute-force alternative is to return `fastFib(n-2) + fastFib(n-1)` every call _without_ storing the answers, and this is a wildly inefficient algorithm. It's almost criminal. It will bog down if you try to go much further than `Fib(45)`. The dynamic-programming approach allows us to calculate `Fib(99)` without breaking a sweat.

There is however an improvement to be made here, and that is to pass along a _pointer_ to the map rather than the map itself.

As it is, the function takes `n int` and `ns map[int]int`. This will 
