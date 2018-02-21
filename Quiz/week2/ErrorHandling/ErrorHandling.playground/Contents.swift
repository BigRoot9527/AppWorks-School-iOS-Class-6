//#1
enum GuessNumberGameError: Error {
    case wrongNumber(description: String )

}

class GuessNumerGame {
    var targetNumber = 10
    
    func guess(number: Int) throws {
        
        guard number == targetNumber else{
            
            throw GuessNumberGameError.wrongNumber(description: "not this number")
        }
     
        print("Guess the right number: \(targetNumber)")
    }
}

//#2
let game = GuessNumerGame()

try game.guess(number: 10)

do {

    try game.guess(number: 20)

} catch GuessNumberGameError.wrongNumber(description: let Error) {

    print(Error)

}


