func printString(_ string: String){
    print("Printing string: \(string)")
}

let stringPrinterFunction = printString
//func can be assigned to var or cons.
//in swift, function are treated as first class citizens or first class objs: Swift func are entities that support all the operations generally available to other types like int or string.

stringPrinterFunction("Hello")
//type of stringPrinterFuntion is (string) -> ()
//reads: "string to void" , also call "func(method) signature"

////

func sum(a: Int, b: Int) -> Int {
    return a + b
}

let addTwoNumber = sum
addTwoNumber(1,2)
//argument labels are not part of a func signature.
//essentially a func boils down to the arguments it accepts and the values it return.


////Function as Parameters

func displayString(usingFunction function: (String) -> Void){
    function("func inside a func")
}

displayString(usingFunction: printString)
displayString(usingFunction: printString(_:))
displayString(usingFunction: stringPrinterFunction)

////

extension Int {
    func applyOperation(_ operation: (Int) -> Int) -> Int {
        return operation(self)
    }
}

func double(_ value: Int) -> Int {
    return value * 2
}
10.applyOperation(double)

////////

typealias IntergerFunction = (Int) -> Void

//also can write as gameCounter() -> (Int) -> ()
func gameCounter() -> IntergerFunction{
    var localCounter = 0
    func increment(_ i: Int){
        localCounter += i
        //in this case, the inner func is able to capture the state of localCounter, even though it is declared in the outer scope.
        print("Integer passed in: \(localCounter)")
    }
    return increment
}

let counter = gameCounter()
//assign to counter the result of calling game counter.
counter(2)
counter(2)
//we've captured the context or the state of their variable.
//because the increment func we're executing, is assigned to a constant, the state of increment func and the value of what local counter is inside this func is captured and maintained in this constant.
//everytime we call the func, we call the very same func that's assigned to counter, not just a version of that func.

//This combination of a func in captured variable from the surrounding context is called a "CLOSURE", which is REFERENCE TYPE (another reference type is Class).
/* in this case, increment is not the closure, but counter is.*/

func plusNum(with num: Int) -> Int {
    var local = 0
    local = local + num
    return local
}
// aNum is NOT a closure
let aNum = plusNum
aNum(3)
aNum(4)
aNum(6)

//////

extension String{
    func transform (aString applyFunction:(String) -> String) -> String{
        return applyFunction(self)
    }
}

func removeVowels(from string:String) -> String{
//    var newString = ""
//    for each in string.characters{
//        switch each{
//        case "a", "e", "i", "o", "u": break
//        default: newString.append(each)
//        }
//    }
//  return newString
    return string.filter{ !["a", "e", "i", "o", "u"].contains($0) }
}

let result = "Hello, World!".transform
result(removeVowels)
//also can write as(argument name needed):
let result2 = "Hello, Another World!".transform(aString: removeVowels(from: ))





