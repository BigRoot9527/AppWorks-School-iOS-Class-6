// Object Initialization

// init?() - failable initializer
//used when you want to indicate failure to create an instance with a "nil" value.
class Person {
    let name: String
    let age: Int
    
    init?(dict: [String: AnyObject]) {
        guard let name = dict["name"] as? String, let age = dict["age"] as? Int else {
            return nil
            //we can return nil, because this is a failable initializer.
        }
        self.age = age
        self.name = name
    }
}

// init() throws {} - throwing initializer
// using it if you want to continue execution after initialization fails by addin an alternative path to your code.

enum PeopleError: Error {
    case invalidData
}

class People {
    let name: String
    let age: Int
    
    init(dict: [String: AnyObject]) throws {
        guard let name = dict["name"] as? String, let age = dict["age"] as? Int else {
            throw PeopleError.invalidData
        }
        self.age = age
        self.name = name
    }
}


//
// Initializer Delegation - Value Types
struct Point {
    var x: Int = 0
    var y: Int = 0
}

struct Size {
    var width: Int = 0
    var height: Int = 0
}

struct Rectangle {
    var origin = Point()
    var size = Size()
    
    init(origin: Point, size: Size) {
        self.size = size
        self.origin = origin
    }
    
    init(x: Int, y: Int, height: Int, width: Int) {
        let origin = Point(x: x, y: y)
        let size = Size(width: width, height: height)
        
        self.init(origin: origin, size: size)
        //instructing another initializer in the same type to finish up the init process
    }
    //to construct an instance of Point and Size
    
    init(center: Point, size: Size) {
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        let origin = Point(x: originX, y:originY)
        
        self.init(origin: origin, size: size)
    }
}

// Initializer Delegation - Reference Types
// involves assingning initial values to both the classes stored properties, as well as any properties inherited from its super or base class.

/*
 Designated(指定的) Initializer -
 Central point of initialization
 Classes must have at least one
 Responsible for initializing stored properties
 Responsible for calling super init
*/

/*
 Convenience Initializer -
 secondary supportin initializer for a class.
 can only call a designated initializer from "within the SAME CLASS" with some of the parameters set to a default value.
*/

class Vehicle {
    let name: String
    
    init(name: String) {
        //Designated Initializer
        self.name = name
    }
    convenience init() {
        //Convenience Initializer
        self.init(name: "Unnamed")
        //to provide the default value for the name parameter.
        //self.nam = "Unnamed"  XXX
        //in a convenience init, you need to call designated init first before assigning any values to stored properties.(in a convenience init, the class has to be set up first.)
    }
}

Vehicle()
//using the concenience init


//
// Initializer Delegation - Superclasses
class Car: Vehicle {
    let numberOfDoors: Int
//Designated init is responsible for calling any init in its superclass chain and getting that entrie chain ready for use.
    init(name: String, numberOfDoors: Int) {
        self.numberOfDoors = numberOfDoors
        super.init(name: name)
        //call the designated init of the superclass
        //we CANNOT call any of the convenience init on the vehicle class here.
    }
    convenience override init(name: String) {
        //defining an init method that has already been defined in the base class(init with name). need override.
        self.init(name: name, numberOfDoors: 4)
    }
    convenience init() {
        self.init(name: "Unnamed")
        //this conv init does not override any of the superclass' desig init method.
        //this conv init is calling another conv init above.
    }
}

// Rule #1
//Every class must have a designated init.
//Responsible for calling superclass' desig init.
// Rule #2
//Any number of conv inits.
//Can call other init in the same class.
// Rule #3
//Conv inits must call a desig init eventually


//
// Required Initializers
//indication that all subclasses must provide an implementation for this particular init method.
import UIKit

class ViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        //fatalError()
        super.init(coder: aDecoder)
    }
    //a class can contain more than one desig init.
}

