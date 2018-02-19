//Notice that all the properties are either optional or having deault value,
//When a "var" stored property is an optional property, it's initially initialized to NIL automatically.

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
}

class Residence {
    var numberOfRoom = 1
    var address : Address?
}

class Person {
    var residence: Residence?
}

let susan = Person()
let address = Address()
address.buildingName = "Bull"
address.buildingNumber = "87"
address.street = "1234 yoyo diy street"
let residence = Residence()
residence.address = address
susan.residence = residence

if let buildingNumber = susan.residence?.address?.buildingNumber {
    print(buildingNumber)
} else {
    print("GG")
}






















