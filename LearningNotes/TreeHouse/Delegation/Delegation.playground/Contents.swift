// Delegate Pattern

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class Horse {
    let name: String
    let maxSpeed: Double
    var distanceTraveled = 0.0
    var currentLap = 1
    
    init(name: String, maxSpeed: Double) {
        self.maxSpeed = maxSpeed
        self.name = name
    }
    
    var currentSpeed: Double {
        let random = Double(arc4random())
        return random.truncatingRemainder(dividingBy: maxSpeed - 13) + 13
    }
}

protocol HorseRaceDelegate: class {
    func race(_ race: Race, didStartAt time: Date)
    func addLapLeader(_ horse: Horse, forLap lap: Int, atTime time: Date)
    func race(_ race: Race, didEndAt time: Date, withWinner winner: Horse)
}

class Tracker: HorseRaceDelegate {
    
    struct Keys {
        static let raceStartTime = "raceStartTime"
        static let lapLeader = "leaderForLap"
        static let raceEndTime = "raceEndTime"
        static let winner = "winner"
    }
    
    var stats = [String: Any]()
    
    func race(_ race: Race, didStartAt time: Date) {
        stats.updateValue(time, forKey: Keys.raceStartTime)
    }
    
    func addLapLeader(_ horse: Horse, forLap lap: Int, atTime time: Date) {
        let lapLead = "Horse: \(horse.name), time: \(time)"
        let lapLeadKey = "\(Keys.lapLeader) \(lap)"
        
        stats.updateValue(lapLead, forKey: lapLeadKey)
    }
    
    func race(_ race: Race, didEndAt time: Date, withWinner winner: Horse) {
        stats.updateValue(winner.name, forKey: Keys.winner)
        stats.updateValue(time, forKey: Keys.raceEndTime)
        
        printRaceSummary()
    }
    
    func printRaceSummary() {
        print("***********")
        
        let raceStartTime = stats[Keys.raceStartTime]!
        print("Race start time: \(raceStartTime)")
        
        for (key, value) in stats where key.contains(Keys.lapLeader) {
            print("\(key): \(value)")
        }
        
        let raceEndTime = stats[Keys.raceEndTime]!
        print("Race end time: \(raceEndTime)")
        
        let winner = stats[Keys.winner]!
        print("Winner: \(winner)")
        
        print("***********")
    }
}

class RaceBroadcaster: HorseRaceDelegate {
    
    func race(_ race: Race, didStartAt time: Date) {
        // some implementation
    }
    
    func addLapLeader(_ horse: Horse, forLap lap: Int, atTime time: Date) {
        // some implementation
    }
    
    func race(_ race: Race, didEndAt time: Date, withWinner winner: Horse) {
        // some implementation
    }
}

class Race {
    let laps: Int
    let lapLength: Double = 300
    let participants: [Horse]
    
    weak var delegate: HorseRaceDelegate?
    
    lazy var timer: Timer = Timer(timeInterval: 1, repeats: true) { timer in
        self.updateProgress()
    }
    
    init(laps: Int, participants: [Horse]) {
        self.laps = laps
        self.participants = participants
    }
    
    func start() {
        RunLoop.main.add(timer, forMode: .defaultRunLoopMode)
        delegate?.race(self, didStartAt: Date())
        print("Race in progress...")
    }
    
    func updateProgress() {
        print("....")
        for horse in participants {
            horse.distanceTraveled += horse.currentSpeed
            
            if horse.distanceTraveled >= lapLength {
                horse.distanceTraveled = 0
                
                delegate?.addLapLeader(horse, forLap: horse.currentLap, atTime: Date())
                horse.currentLap += 1
                
                if horse.currentLap >= laps + 1 {
                    delegate?.race(self, didEndAt: Date(), withWinner: horse)
                    stop()
                    break
                }
            }
        }
    }
    
    func stop() {
        print("Race complete!")
        timer.invalidate()
    }
}

let jubilee = Horse(name: "Jubilee", maxSpeed: 16)
let sonora = Horse(name: "Sonora", maxSpeed: 17)
let jasper = Horse(name: "Jasper", maxSpeed: 17)

let participants = [jubilee, sonora, jasper]

let race = Race(laps: 1, participants: participants)
let tracker = Tracker()
let broadcaster = RaceBroadcaster()
race.delegate = broadcaster
race.start()

class RaceManager: HorseRaceDelegate {
    
    let race: Race
    
    init(race: Race) {
        self.race = race
        race.delegate = self
        race.start()
    }
    
    func race(_ race: Race, didStartAt time: Date) {
        // some implementation
    }
    
    func addLapLeader(_ horse: Horse, forLap lap: Int, atTime time: Date) {
        // some implementation
    }
    
    func race(_ race: Race, didEndAt time: Date, withWinner winner: Horse) {
        // some implementation
    }
}























































