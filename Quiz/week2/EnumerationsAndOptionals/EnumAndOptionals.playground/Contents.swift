//#1

enum Gasoline {
    case type92
    case type95
    case type98
    case diesel
    
    func getPrice() -> Double {
        switch self{
        case .type98:
            return 94.87
        case .type95:
            return 55.66
        case .type92:
            return 85.91
        case .diesel:
            return 11.11
        }
    }
}

let someGasoline = Gasoline.type95
someGasoline.getPrice()

//#2
class Pet {
    let name: String
    init(name: String){
        self.name = name
    }
}

class People {
    var pet: Pet?
    init(pet: Pet?){
        self.pet = pet
    }
}

let aDog = Pet(name: "Hot")
let anElephant = Pet(name: "象")
let aPerson = People(pet: nil)
let onePerson = People(pet: aDog)
let anotherPerson = People(pet: anElephant)

func checkPet(of person: People) -> String? {
    guard let pet = person.pet else {
        return nil
    }
    return "This Person has a pet, named \(pet.name)"
}

let answer1 = checkPet(of: anotherPerson)

func searchForPet(of person: People) -> String? {
    if let pet = person.pet {
        return "You got a , named \(pet.name)"
    } else {
        return nil
    }
}

let answer2 = searchForPet(of: onePerson)


