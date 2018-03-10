extension Int {
    func apply(_ value: Int, operation: (Int,Int) throws -> Int) rethrows -> Int {
        //by seeing that the apply func is a throwing func as well. we can propagate the error to the call site.
        //Rethrows is a pretty special keyword that using in conjunction with "closures that can throw errors".
        //The rethrows keywords indicates to the compiler that the outer func ("aplly" in this case) becomes a throwing func "only if the closure passed in throws an error" that is propagated(傳送) to the current scope.
        return try operation(self, value)
    }
}

enum MathError: Error {
    case divideByZero
}

do {
    try 10.apply(0) {
        if $1 == 0 {
            throw MathError.divideByZero
        } else {
            return $0/$1
        }
    }
} catch MathError.divideByZero {
    print("Error")
}

10.apply(12) { $0 + $1 }

//because apply can throw, we can pass in a closure and from within the closure we can throw the error.

//Regular funcs are subtype of throwing funcs with the same signature, so that we can pass in a reular non throwing closure { $0 + $1 } to the func has argument marked as throwing.
//EX:
func someFunction(a: Int) throws {}
func anotherFunction(a: Int) {}
//here you can use anotherFunction wherever someFunction is expected, because anotherFunction is a subtype of someFunction.
//This means that the "Function Signature" is identical minus the throws bit.
//!!However you cannot use someFuction where anotherFunction is expected.

//
// Memory Consideration
class NetworkSessionManager {
    
    typealias CompletionHandler = () -> Void
    
    var completionHandlers: [CompletionHandler] = []
    //the closure escapes and we put it in this array.
    
    func dataTask(with handler: @escaping CompletionHandler) {
        completionHandlers.append(handler)
        //this closure no longer reside(留) just in the body of dataTask func.
        //To allow the closure to escape, we add the keyword "@escaping" right before that argument type.
        //inside the body of the closure, if you reference the outer scope, if you were to use "self" in here, you would have to do this explicitly(直述地)
        //if a closure is non-escaping which all closures are by defaul, then "self" that is referring to the outer scope is done implicitly(隱含地)
    }
    //Executing a closure sometime after the containing func returns. dataTask with handler, the func we're calling is going to finish excuting and retrun without having executed the closure passed into it. At some point later we'ew going to retrieve(補償) this handler back out of the array and execute it.
    //This is typical of asynchromous(不同步的) code that runs independent of the main program flow.
    //In cases like this, where the closure is called after the func returns, we say that "The Closure Escapes".
}


//
// Reference Cycles
class Fibonacci {
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    
    
    //[]CAPTURE LIST: Defines the rules to use when capturing reference types within a closure's body (like <self.value below).
    //[]+"in", inside[] is  weak/unowned + "the reference" to the class or property we're trying to capture.
    //!!!use a WEAK reference when the obj being captured (the reference type be captured) has a shorter life time (is deallocated first.) than the obj holding on to it.
    //On this example, both the closure and the class have the same lifetime because one doesn't exist without other. So we use an UNOWNED reference.
    lazy var fibonacci: () -> Int = { [unowned self] in
        // Some temporary variables.
        //A lazy stored property is a property whose initial value is not calculated until the first time it is used.
        //You must always declare a lazy property as a "VAR", because its initial value might not be retrieved until after instance initialization completes. Constant properties must always have a value "before" initialization completes, and therefore cannot be declared as lazy.
        var a = 0
        var b = 1
        
        // Add up numbers to the desired iteration.
        for _ in 0..<self.value {
            //!! the closure captures a reference to self by calling Value property. (by defaut because Fibonacci is Class) This is a strong relationship from the closure to the Fibonacci class.
            //!! the closure is also assigned to a stored property which also has a strong relationship by default, we now have a strong reference going from the class to the closure as well.
            // => creates a reference cycle
            let temp = a
            a = b
            b = temp + b
        }
        
        return a
    }
    
    deinit {
        //A deinitializer is called immediately before a class instance is deallocated(釋放).
        //Deinitializers are only available on class types.
        print("\(value) is being deinitialized. Memory deallocated")
    }
}

let f = Fibonacci(value: 7)
f.fibonacci()

var t: Fibonacci? = Fibonacci(value: 8)
//create an optional instance of Fibonacci.
t?.fibonacci()
//use it
t = nil
//assibg nil to the variable

//!!when we assign nil, you don't see a log statement from the deinit method. Meaning that the instance has not been deinitilized because of that strong reference cycle.
//!! When using closures you need to be aware of Reference Cycles.(also when using classes)
// Closures solve this problem by defining what is called a "CAPTURE LIST" as part of the closures definition(at the start of the closure body).
