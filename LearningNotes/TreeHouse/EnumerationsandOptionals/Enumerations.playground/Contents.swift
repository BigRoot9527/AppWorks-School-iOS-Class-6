//EnumerationandOptionals#1 - Enum

class Point {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

enum Direction {
    case left
    case right
    case up
    case down
}

class Robot {
    var location: Point
    
    init() {
        self.location = Point(x: 0, y: 0)
    }
    
    func move(_ direction: Direction) {
        // Enter your code below
        switch direction {
        case .left :
            location.x -= 1
        case .right :
            location.x += 1
        case .up :
            location.y += 1
        case .down :
            location.y -= 1
        }
    }
}

//

import UIKit

enum ColorComponent {
    case rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    case hsb(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)
    
    func color() -> UIColor {
        switch self{
        case .rgb(let red, let green, let blue, let alpha):
            return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
        case .hsb(let hue, let saturation, let brightness, let alpha):
            return UIColor(hue: hue/360.0, saturation: saturation/100.0, brightness: brightness/100.0, alpha: alpha)
        }
    }
}

ColorComponent.rgb(red: 100.0, green: 200.0, blue: 130.0, alpha: 1.0).color()


//

// Example of UIBarButtonItem instance
// let someButton = UIBarButtonItem(title: "A Title", style: .plain, target: nil, action: nil)

enum BarButton {
    case done(title: String)
    case edit(title: String)
    
    func button() -> UIBarButtonItem {
        switch self {
        case .done(let done):
            return UIBarButtonItem(title: done, style: .done, target: nil, action: nil)
        case .edit(let edit):
            return UIBarButtonItem(title: edit, style: .plain, target: nil, action: nil)
        }
    }
}

let done = BarButton.done(title: "Save")
let button = BarButton.done(title: "Save").button()


//Raw Value(c.f. with associate value)
//need to be all the same type
//no custom tyep
//Int raw value are auto incrementing (first will be 0 if all rawvalue are unset)
//String raw value are "case name" by default

enum Coin : Double {
    case penny = 0.01
    case nickel = 0.05
    case dime = 0.1
    case quarter = 0.25
}

let coins: [Coin] = [.penny, .nickel, .quarter, .dime, .dime, .penny, .quarter, .dime]

func sum(having coins:[Coin]) -> Double{
    var total: Double = 0
    for coin in coins{
        total += coin.rawValue
    }
    return total
}

sum(having: coins)

//

enum TestRawInt : Int {
    case one = 1
    case two
    case three
    case four
    case five
}

TestRawInt.four.rawValue

enum TestRawString : String {
    case father
    case mother
    case brother
    case sister
}

TestRawString.mother.rawValue

//
// initialize with enum

enum HttpStatus: Int {
    case notFound = 404
    case success = 200
    case forbidden = 403
    case unauthorize = 401
}

let statusCode = 200

//httpStatusCode is String?
if let httpStatusCode = HttpStatus(rawValue: statusCode){
    print (httpStatusCode) }


//
//

enum Compass: Int {
    case north
    case south
    case east
    case west
}

let direction = Compass(rawValue: 1)

