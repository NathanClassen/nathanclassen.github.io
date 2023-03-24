---
title: "go pointers"
date: 2023-03-17T13:23:02-05:00
draft: true
---

explaining pointers to myself in Go

keeping in mind that `&` gives the address of a variable, a pointer and `*` dereferences the pointer to get the actual underlying value

```go
package main

import "fmt"

func main() {
	i := 1         	                            //	i is the value of 1, held at <some_address>
	p := &i        	                            //	p is the value of <some_address>, held at <<some_other_address>>
	fmt.Println("i is: ", i)                    //	print i's value
	fmt.Println("p is: ", p)                    //	print the address at which i's value is stored, by printing the value of p
	fmt.Println("i's address is indeed: ", &i)  //	print the address at which i's value is stored, by
                                                //      explicitly printing i's address via the `&` operator

	i = 2                                       //	i's value is now 2, that is to say, the value held at <some_address> is now 2
	fmt.Println("see, i is now! ", i)           //	print i's value... see!
	fmt.Println(p)                              //	now, p is still the value of <some_address>, which is still the location at which i stores it's value
	fmt.Println(&p)                             //	as an aside, here is <<some_other_address>>, that is to say, here is the location at which is stored <some_address>
                                                //	as was said, p is still the value of <some_address>, that is to say, p still "points at" or rather contains a pointer to i
	fmt.Println(*p)                             //		so if we use the * operator to get the the underlying value of pointer p, we will get whatever the current value of i is...
                                                // so it is clear: because p is a pointer to i, any change made to i will mean a change in the underlying value of pointer p
                                                // this also means that we can change the value of i without referencing the variable i, but rather through the pointer variable p!
    *p = 3                                      // here we say that (*)(p) (=) (3), that is, (the underlying value of pointer:)(p) (equals) (3)
    fmt.Println(i)                              // the value of i is now 3

                                                // here is another example

	j := 1                                      //	i is the value of 1, held at <an_address>
	q := j                                      //	q is the value of 1, held at <<a_different_address>>
	fmt.Println(j)                              //	here is j's value
	fmt.Println(q)                              //	here is q's value
	fmt.Println(&j)                             //	here is j's address (an_address)
	fmt.Println(&q)                             //	here is q's address (a_different_address)
	j = 2                                       //	here we reassign j to 2, that is to say, we say that the value at <an_address> is 2
                                                //	unlike the last example, the value of the second variable, q, is unaffected, because it is not a pointer, but a separate variable
                                                //		with it's own address, and so it does not track with j at all
	fmt.Println(j)
	fmt.Println(q)                              //	see?

}
```