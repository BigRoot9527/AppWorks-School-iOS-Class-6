/*
 Error Handling:
 Error protocol, throw/throws, try, do, catch
*/

//Error: code that produces an incorrect or unexpected result, or causes your program to behave in an unintended manner.

//Compiler Error: errors that the Swift compiler raises as it parses or read the code, and prevents it from runing.
////Domain Errors: putting the value outside of acceptable range of value or the domain. Ex: Int.init("a").
    //Swift deals domain errors by using optionals(returning nil) through the use of a failable initializer.  init?() {}
    var optionalInt: Int? = Int.init("1")

//Runtime Errors: only occur when running program and hit a particular line of code.
////Recoverable Errors: << we focusing on
////Unrecoverable Errors (failures):
//////logic errors: occur from a programmer's mistake.
//////universal errors: error occurring cannot be anticipated

//
//Recoverable Error:

struct Friend{
    let name: String
    let age: String
    let address: String?
}

//When using an enum, we can group a related set of errors into a single type, and define each individual type of error as an enum member.
enum FriendError: Error /*error protocol*/{
    case invalidData(description: String)
    case someError
    
}

//anticipate and treat the nil value as a recoverable errer
func friend(from dict: [String:String]) throws -> Friend {
    guard let name = dict["name"] else {
        throw FriendError.invalidData(description: "Invalid name value.")
        //keyword "throw" always takes an argument.
    }
    guard let age = dict["age"] else {
        throw FriendError.invalidData(description: "Invalid age value.")
    }
    let address = dict["adress"]
    return Friend(name: name, age: age, address: address)
}
//When we specifically want to indicate thaat our func contains code that can result in an error, we indicate this in the signature of the func with the keyword "throws".
//Throws, is always added in the func declaration after the parameter list and before the return type.
//Note: A func or method cannot throw an error unless explicitly indicated using the throws keyword.
//At any point inside the body of a throwing func, you can return an error by using the keyword "throw"(with our the S).
//when hitting a throw statement, you exit the current scale.

//Because of throwing func can fail, we need to try and call it and we do this using keyword "try".

let response = ["name": "BRoot", "ge": "28", "address": "someAddress"]

/* let someFriend = try friend(from: response) */
//having a line of code with the keyword "try", the code after this line, "may not" be executed depending on the result of this func call.
/* print(someFriend)   <= this code may not be executed */

//Processing an error: catching it, and then handling it. by using a do catch statement.
//Inside the do statement, we add any func that can throw errors. Along with the call to the throwing func, we add an code that depends on these throwing funcs being successfully executed.
func send(message: String,to friend: Friend){}
do {    //do clause contains a path of code that going down if everything secceeds.
    let myFriend = try friend(from: response)
    send(message: "Test", to: myFriend) //<=only works if try friend() works
} catch let error {  /*catching error and binding it to the local constant (automatically by default)*/
//If an error is thrown form code inside a do clause, the error is propagated to its outer scope unitil it is handled by a "catch clause".
    print (error)

}

do {
    let myFriend = try friend(from: response)
    send(message: "Test2", to: myFriend)
} catch FriendError.invalidData(let description) {
    //A catch clause can include an optional pattern like the case in the switch statement that matches on the error. In this case, it catching a very specific error.
    print (description)
} catch FriendError.someError {
    //If we want to handle more than one particular error, we can add subsequent catch clauses.
}

//Note:Swift's error handling mechanism doesn't preserve the type of error throw. We need to figure out what different kinds of errors can occur from calling try func, and react to them in ways that are approriate for our users.

//
//
enum ParserError: Error {
    case emptyDictionary
    case invalidKey
}

struct Parser {
    
    var data: [String : String?]?
    
    func parse() throws {
        guard let check = data else {
            throw ParserError.emptyDictionary
        }
        // data?.keys.contains("someKey") returns Bool?
        // Bool? == Bool returns Bool
        // so guard data?.key.contains("someKey") == true also works
        guard check.keys.contains("someKey") else {
            throw ParserError.invalidKey
        }
   }
}

let data: [String : String?]? = ["someKey": nil]
let parser = Parser(data: data)

do {
    try parser.parse()
} catch ParserError.emptyDictionary{
    print("dictionary is empty")
} catch ParserError.invalidKey{
    print("invalid key")
}

//
//Defer
//A defer statement executes code within the statement when the program execution leaves the current scope.
//Note:
//1. they are not tied to error handling necessarily. Defer statement can be used anywhere you want to defer execution.(But in most cases, you will be using it along with error handling statements.)
//2. You can also add multiple defer statement in a single function and they're executed in "reverse order".

