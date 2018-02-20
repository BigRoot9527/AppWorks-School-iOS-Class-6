//Protocol Inheritance

protocol Printable {
    func description() -> String
}

protocol PrettyPrintable: Printable {
   func prettyDescription() -> String
}

//unlike classes, protocol can inherit from many other protocols.
struct User: PrettyPrintable, Equatable {
    let name: String
    let age: Int
    let address: String
    
    func description() -> String {
        return "\(name), \(age), \(address)"
    }
    // when using protocol inheritance anyting that conforms to PrettyPritable, must also satisfy the requirements of Printable first, and the any addtional requirements enforced by PrettyPrintable.
    func prettyDescription() -> String {
        return "Name: \(name)\nAge: \(age)\nAddress: \(address)"
    }
    // A static function is called on the type.
    // An instance method is called on the instance.
    static func ==(lhs: User, rhs: User) -> Bool{
        return lhs.name == rhs.name && lhs.age == rhs.age && lhs.address == rhs.address
    }
}

let user = User(name: "BRoot", age: 28, address: "someAddress")
user.description()
print(user.prettyDescription())

//
//
//Standard Library Protocols:

//Can Do (-able): Used to represent behavior, where an object can do something.Ex: Equatable, Comparable, Hashable, Strideable...
    let anotherUser = User(name: "BRoot", age: 28, address: "someAddress")
    user == anotherUser
    //user == anotherUser will cause an error//
//Is A (use nouns to model the identity of obj): If your object is a type of another object, then it should inherit from it using class inheritance.Ex: collection protocol, integer protocol...
    //They model the identity of an object, form the basis for all the type so far.
//Can Be (-Convertible >> ExpressibleBy -): Model behavior where one type can be converted to another type.Ex: ExpressibleByArrayLiteral, CustomStringConvertible(Printable we wrote), ExpressibleByFloatLiteral,ExpressibleByNilLiteral(Optional conforms that)
    //Objs that conform to these protocols can also be initialized with the literail value specified in the protocol.

