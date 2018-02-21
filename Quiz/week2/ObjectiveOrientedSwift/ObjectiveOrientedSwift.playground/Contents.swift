//#1
enum Gender {
    case male
    case female
    case undefined
}

class Animal {
    let gender: Gender
    
    init(gender: Gender) {
        self.gender = gender
    }
    
    func eat() {
        print("I eat everything!")
    }
}

let cat = Animal(gender: .male)
cat.eat()

//#2
class Elephant: Animal {
    override func eat() {
        print("Actually I eat 車")
    }
}
let elephant = Elephant(gender: .female)
elephant.eat()

class Tiger: Animal {
    override func eat() {
        print("In fact I eat my son.")
    }
}
let tiger = Tiger(gender: .undefined)
tiger.eat()

class Horse: Animal {
    override func eat() {
        print("I eat 炮")
    }
}
let horse = Horse(gender: .female)
horse.eat()

//#3
class Zoo {
    var weeklyHot: Animal?
    init(){}
}

let zoo = Zoo()

zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot = horse

