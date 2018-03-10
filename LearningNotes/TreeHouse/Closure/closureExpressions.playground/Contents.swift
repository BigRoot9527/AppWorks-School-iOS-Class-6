//Closures - combination of func and environment of captured var
//Closures = anonymous funcs, lambdas, blocks.

func square(_ int: Int) -> Int {
    return int * int
}
[1,2,3].map(square)
// (square) is a closure

[1,2,3].map { (int) -> Int in
    return int * int
}
// { } = closure expression

/*
 Closure expression != Closures
 Closure expression syntax general form:
 
 { (parameters) -> return type IN statements }
 
 return type = the type of the closure.
 statements = body of the closure.
*/

func double(_ value: Int) -> Int {
    return value * 2
}
let doubleFunction = double
doubleFunction(2)

let numbers = [1,2,3,4,5]
let doubleNumbers = numbers.map(doubleFunction)
//map func takes each value out of the array, and work with each value.
/*
 Outer func: map func.
 Inner func: doubleFunction, captures the var defuned in the map context.
 */

//
// Closure Expression Syntax

// Rule #1: Define the Closure In Line
//(or you can pass it in directly.)
//(if all you're doing is passing in your closure as an argument then you don't need to assign it a local var or cons.)
let tripledNumbers = numbers.map({(value: Int) -> Int in
    return value * 3
})
// the 6th time is to return the entire array.
// the Closure Expression is the code inside the map funciton.

// Rule #2: Inferring(推論) Type From Context
numbers.map({value in return value * 3 })
// Swift is always possible to infer parameter types and return types when passing a closure to a fuc as an inline closure expression.

// Rule #3: Implicit Returns from Single-Expression Closures
numbers.map({value in value * 3})
//(if we have a single expression closure, that is, we're only evaluating a single expression as we're doing here. Then the return value is actually implicit(固有的), we don't need to write the return keyword.)

// Rule #4: Shorthand Argument Names
numbers.map({ $0 * 3 })
//(Swift automatically provides shorthand argument names to inline closures. ONLY to inline closures, which can then be used to refer to values of the closures arguments by certain name.
//The number and type of shorthand arguments will be inferred from the "expected function type"
//(argument type (the signature of the func) that is inferred depends on the collection that we're calling map on).
//(return type depends on what you actually do in the transformation func.)

// Rule #5: Trailing Closures
numbers.map() { $0 * 3 }
//(If the closure expression is the last argument to a func, you can move the expression outside the parentheses of the func call and write it as a trailing closure instead.)
//(A trailing closure is a closure expression that is written outside and after the parentheses of the func call that it supports.)

numbers.map() { number -> Int in
    if number % 2 == 0 {
        return number/2
    }
    
    return number/3
}

// Rule #6: Ignoring Parentheses
numbers.map{ $0 * 3 }
//(If the closure expression is the only argument to the func, then you can get rid of the func's parentheses altogether.)


// QUIZ

func doubleTwo(_ i: Int) -> Int {
    return i * 2
}

let doubler = doubleTwo
let doubledValues = [1,2,3,4].map(doubler)

[1,2,3,4].map{ $0 * 2 }

