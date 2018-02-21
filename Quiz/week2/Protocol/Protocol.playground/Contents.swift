//#1

//struct Person {
//    let name: String
//}

protocol PoliceMan {
    func arrestCriminals()
}

//#2

struct Person: PoliceMan {
    let name: String
    //#4
    let toolMan: ToolMan
    func arrestCriminals() {
    }
}

//#3

protocol ToolMan{
    func fixComputer()
}

//#5

struct Engineer: ToolMan {
    func fixComputer() {
    }
}

//#6
let aPerson = Person(name: "Steven", toolMan: Engineer())


