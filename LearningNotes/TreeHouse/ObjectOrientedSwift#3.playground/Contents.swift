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

//var a = struct  <- Value type
//var b = a  <- copyOfValue

//var c = class <- Reference type
//var d = c  <-establishOfReference


struct Tag {
    let name: String
}

struct Post {
    var title: String
    var author: String
    var tag: Tag
    func description() -> String{
        return "\(title) by \(author). Filed under \(tag.name)."
    }
}


let firstPost = Post(title: "Hello", author: "BR", tag: Tag(name: "try"))
let postDescription = firstPost.description()

////

class Point {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

class Machine {
    var location: Point
    
    init() {
        self.location = Point(x: 0, y: 0)
    }
    
    func move(_ direction: String) {
        print("Do nothing! I am a machine!")
    }
}

class Robot: Machine{
    override func move(_ direction: String) {
        switch direction {
        case "Up":
            self.location.y += 1
        case "Down":
            self.location.y -= 1
        case "Right":
            self.location.x += 1
        case "Left":
            self.location.x -= 1
        default:
            break
        }
    }
}













