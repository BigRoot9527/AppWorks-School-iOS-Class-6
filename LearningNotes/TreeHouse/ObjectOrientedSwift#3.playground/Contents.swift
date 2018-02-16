class Person {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}

// Enter your code below
class Doctor: Person{

    override func fullName() -> String {
        return "Dr. \(lastName)"
    }
}

let someDoctor = Doctor(firstName: "Jeremiah", lastName: "Hsu")


//ValueVsReference

//var a = struct
//var b = a  <- copyOfValue

//var c = class
//var d = c  <-establishOfReference

