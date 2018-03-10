// Standard Library Functions

let values = [1,2,3,4,5]

var newArray = Array<Int>()

//imperative programming: tell the compiler what to execute, line by line for each step. results in a "Mutable" value (var).(How we want to do)
for number in values {
    newArray.append(number * 2)
}

//declarative programming: code that describes the end result. no intermediate steps for how you want to get there. results in an immutable value.(What we want to do)
let doubledNumbers = values.map{ $0 * 2 }

// Functional programming: a declarative style of programming where use many small funcs that return immutable data type.

//MAP func: apply a transformation func to an array of values and getting an immutable new array back that does not mutate the original data set.

//MAP
extension Array {
    func customMap<T>(_ transform: (Element) -> T) -> [T] {
        //<T>: generic type
        //Element here refers to the type parameter defined in array.
        var result = [T]()
        
        for x in self {
            result.append(transform(x))
        }
        
        return result
    }
}

let integerValues = ["1","2","3","4","5"].customMap{ Int($0) }
// type of integerValues is [Int?] since the Int() is failable, the return type of transformation is optional Int.

import Foundation

struct Formatter {
    static let formatter = DateFormatter()
    
    static func date(from string: String) -> Date? {
        formatter.dateFormat = "d MMM yyyy"
        return formatter.date(from: string)
    }
}

let dateStrings = ["10 Oct 1988", "11 Jan 1947", "28 Mar 2002"]

let dates = dateStrings.customMap { Formatter.date(from: $0)}
print(dates)

// Only use map in theory when you want to transform an array by applying a transformation func to go form one type to another.
// For loop are used when you want to perform side effects(executing code on looping over the array mutates an obj or modifies the state of your program elsewhere).


//
// FlatMap

// Example 1
struct Post {
    var content: String
    var tags: [String]
}

let blog = [
    Post(content: "Hello, World", tags: ["first","programming"]),
    Post(content: "Another Post", tags: ["general"])
]

let tags = blog.flatMap{ $0.tags }
//func flatMap iterates over an array and applies a transformation func to the individual elements.

// Build A Costom FlatMap
extension Array {
    func customFlatMap<T>(_ transform: (Element) -> [T] ) -> [T] {
        var result = [T]()
        
        for x in self {
            //we're going to append the result of transforming "all contents" of x.
            result.append(contentsOf: transform(x))
            //by using append contents of, swift takes the individual elements from the resulting array and appends it to the result.
        }
        return result
    }
}

// Example 2

import UIKit

struct Account {
    let username: String
    let billingAddress: String?
}


let allUsers = [
    Account(username: "pasanpr", billingAddress: nil),
    Account(username: "benjakuben", billingAddress: "1234 Imaginary Street"),
    Account(username: "instantNadel", billingAddress: "5678 Doesn't Live Here Dr."),
    Account(username: "sketchings", billingAddress: nil),
    Account(username: "paradoxed", billingAddress: "1122 Nope Lane")
]

let validAddresses = allUsers.flatMap{ $0.billingAddress }
//This is specialized version of flapMap written for optional and as you can see even though billingAddress is nil somwhere, we have validAddresses has a type of just "String" not "Sting?"
validAddresses.count

//With flapMap, we're transforming an array of accounts, all users, into an array of Strings without mutating the original data set.


//
//Filter

let evenNumbers = (0...100).filter { $0 % 2 == 0 }
print(evenNumbers)

extension Array {
    func customFilter(_ isIncluded: (Element) -> Bool ) -> [Element] {
        var result = [Element]()
        //where clause is used to introduce a constraint. you can provide any expression that returns a Boolean value as a condition. If true, then we enter the body of the for loop, otherwise we just jump to the next iteration.
        for x in self where isIncluded(x) {
            result.append(x)
        }
        return result
    }
}

let somePUsers = allUsers.customFilter { $0.username.first == "p" }
print(somePUsers)


//
// Reduce
//(reducing a set of values down to a single value)
let scores = [10, 12, 11, 10, 12, 9]

let totalScore = scores.reduce(0, { total, score in total + score })
// 0: initial value (determine the return type of reduce func)
// {}: pass in a cloure that defines our combined func (take total & score as parameters).
// total($0): a var to hold the combined value as we iterate through the array.
// score($1): the element from the array.

extension Array {
    func customReduce<Result>(_ initial: Result, _ nexPartialResult: (Result, Element) -> Result) -> Result {
        var result = initial
        
        for x in self {
            result = nexPartialResult(result, x)
            // Body of Reduce provide argument to the combine func(nexPartialResult), but don't say how it should be combined.
            // That we defer until the Reduce func is called and we pass in a closure expression.
        }
        
        return result
    }
}

let dataSet = (1...100).filter { $0 % 3 == 0 && $0 % 7 == 0}
let identifier = dataSet.reduce("", {string, number in string + "\(number),"})
identifier















