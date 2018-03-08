//Protocol can require that conforming types have specific instance property, instance method, type method an so on.
protocol FullNameable {
    var fullName: String { get }
}
// the User struct conforms to the FullNameable protocol.
struct User: FullNameable {
    var fullName: String
}

let user = User(fullName: "Jeremiah")

struct Friend: FullNameable {
    let firstName: String
    let middleName: String
    let lastName: String
    //computed property: create a property that determines it's value through some computation.
    //connot assign it a value directly and it has no storage
    var fullName: String {
        return "\(firstName) \(middleName) \(lastName)"
    }
}

let friend = Friend(firstName: "Hsu", middleName: "Ting", lastName: "Wei")
friend.fullName

//
//
protocol DUser {
    var name: String { get }
    var age: Int { get set }
}

struct Person : DUser{
    var name: String
    var age: Int
}
let somePerson = Person(name: "BigR", age: 28)

//
//

import Foundation

enum EmployeeType {
    case manager
    case traditional
}

protocol Payable {
    func pay() -> PayCheck
}

struct PayCheck{
    let base: Double
    let benefits: Double
    let deductions: Double
    let vacation: Double
}

class Employee {
    let name: String
    let address: String
    let startDate: Date
    let type: EmployeeType

    init(name: String, address: String, startDate: Date, type:EmployeeType){
        self.name = name
        self.address = address
        self.startDate = startDate
        self.type = type
    }
}

class HourlyEmployee: Employee, Payable {
    var hourlyWage = 15.00
    var hoursWorked = 0.0
    let vacation = 0
    
    func pay() -> PayCheck {
        let base = hoursWorked * hourlyWage
        return PayCheck(base: base, benefits: 0, deductions: 0, vacation: 0)
    }
}

class SalariedEmployee: Employee, Payable {
    var salary = 50000.00
    var benefits = 1000.00
    var deduction = 0.0
    var vacation = 2.0
    
    func pay() -> PayCheck {
        let monthly = salary / 12
        return PayCheck(base: monthly, benefits: benefits, deductions: deduction, vacation: vacation)
    }
}
//Because protocols are fully fledged type like a class or struct, we can specify payable as the argument for a function instead of "employee(the parent class)", which has no information about the payment of each type of employees.
//This guarantees that we can only pass in an instace of a class or a type that comforms to the payable protocol.
//Here were saying that the instance passed in as an argument to pay needs to conform to the payable protocol.
func pay(employee: Payable){
    employee.pay()
}
let employee = HourlyEmployee(name: "BRoot", address: "someAddress", startDate: Date(), type: .traditional)
pay(employee: employee)

//This type of structure where we designed a class through protocol conformance rather than inheritance is called "Composition" and is an extremely powerful tool that helps build encapsulated loosely coupled models and code bases.

//Benefit of protocal #1:
//When we have a set of closely related classes, as these two hourly and salaried employee classes are, that implements methods which define similar behavior (which in this case is the pay method), but end up having different implementations, protocols lead to better code.//
//Because then we do not have to define some placeholder type in the base class (employee) to get to work.

//
//

// Declare protocol here
protocol ColorSwitchable {
    func switchColor (_ color:Color)
}

enum LightState {
    case on, off
}

enum Color {
    case rgb(Double, Double, Double, Double)
    case hsb(Double, Double, Double, Double)
}

class WifiLamp: ColorSwitchable{
    let state: LightState
    var color: Color
    
    init() {
        self.state = .on
        self.color = .rgb(0,0,0,0)
    }
    func switchColor(_ color: Color) {
        self.color = color
    }
}
//
//
//Loosely Related Types

protocol Blendable{
    func blend()
}

class Fruit: Blendable {
    var name: String
    init(name: String){
        self.name = name
    }
    func blend() {
        print("I'm mush!")
    }
}

class Dairy {
    var name: String
    init(name: String){
        self.name = name
    }
}

class Cheese: Dairy {}
class Milk: Dairy, Blendable {
    func blend() {
        print("I'm still milk")
    }
}
//Milk & Fruit can go in a smoothies but they are loose relationships.

func makeSmoothie(with ingredients: [Blendable]) {
    for ingredient in ingredients {
        ingredient.blend()
        //Note (disadvantage): in there we don't have access to ingredient.name because we lose information about the type be specifing it as this higher protocol type rather than the actual class.
    }
}
/*
 Protocols as Types:
 1. As a parameter type or return type.
 2. Type of a constant, variable, or property.
 3. the underlying type of a collection.
*/
let strawberry = Fruit(name: "Strawberry")
let cheddar = Cheese(name: "Cheddar")
let cocoMilk = Milk(name: "Coco")
let ingredients: [Blendable] = [strawberry, cocoMilk]
//withiout the "Blendable" annotation,this array will be miexed types (not allowed)
//Note: we lose certain advantages: we don't know anything about the item in the array other than the fact that they implement the blend method.
makeSmoothie(with: ingredients)

//
//
//Random Number Generator

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.37464991998171"
print("And another one: \(generator.random())")
// Prints "And another one: 0.729023776863283"

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        //Note: the type for ther generator parameter here and the property as well is specified as the random number generator protocol.
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
d6.roll()
//the dice model isn't tied ro any particular random number generator.
//we can define our own implementation, and as long as it conforms to protocol(RandomNumberGenerator),we can use it as a generator for the dice.
//Protocols are a very useful tool in modeling relationships in our objects, and leads to code tha isn't tightly coupled.


/*
 Determin design pattern of composition vs inheritance by check relationship between objs:
 
 IS-A relationship: Inheritance
 If a class wants to model the exact same behavior and attributes of another class and perhaps add to it, then we use inheritance.
 EX: class Jetplane: Airplane {}
 
 HAS-A relationship: Composition
 If you only want to model a paticular aspect, a limited subset of this behavior theb we use composition.
 EX: class Airplane {} & struct Bird{} conform to protocol Fly{}
 
 
 

 
 */
