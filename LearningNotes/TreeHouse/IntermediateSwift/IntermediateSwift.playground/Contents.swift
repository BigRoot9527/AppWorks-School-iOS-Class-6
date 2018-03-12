// Stored Properties

struct Account {
    let username: String
    let password: String
}

let someAccount = Account(username: "BigRoot", password: "123abc")
someAccount.username


//
//(Type method)
class SomeClass {
    static func someMethod() {}
}
// Type Properties
struct Point {
    var x: Int = 0
    var y: Int = 0
}

struct Map {
    static let origin = Point()
    //declaring a type property requires an initializer expression or getter/setter specifier
    
    static var x: Int {
        return origin.x
        //origin is at the same level, it's scoped to the type.
    }
}
//Type property is a property that is associated with a type and does not need an instance to be accessed.
Map.origin
//if using var, we can set a new value on the type rather than an instance.
//Why associate value with the type itself?
//Does this property contain info that provides context, without having to instantiate an instance?


//
// Computed Properties
struct Rectangle {
    let length: Int
    let width: Int
    
    var area: Int {
        return length * width
    }
    //computed property(is read only for this example)
    //computed property can be both instance property and type property (+static)
    //!!computed property must be VAR property.
    //!!computed property CAANOT store values.
    //!!But type property CANNOT use instance member!
}
let r1 = Rectangle(length: 10, width: 12)
r1.area
//
struct Size {
    var width: Int = 0
    var height: Int = 0
}
struct newRectangle {
    var origin = Point()
    var size = Size()
    
    var center: Point {
    //computed properties always require a type annotation, since the value is only computed when we need it.(like func but takes no parameter, and it has a return type that can never be void)
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            
            return Point(x: centerX, y: centerY)
        }
        
        set (centerValue){
            //bind the new value that we assigned to a local constant.
            //this code is run after a value is assigned to the center property.
            origin.x = centerValue.x - size.width/2
            origin.y = centerValue.y - size.height/2
            
        }
        
    }
}

var rect = newRectangle()
print(rect.center)
rect.size = Size(width: 20, height: 15)
print(rect.center)
rect.center = Point(x: 10, y: 15)
print(rect.center)
print(rect.origin)


//
//Code Quiz

let UIFontTextStyleHeadline = "UIFontTextStyleHeadline"
let UIFontTextStyleBody = "UIFontTextStyleBody"
let UIFontTextStyleFootnote = "UIFontTextStyleFootnote"

enum Text {
    case headline
    case body
    case footnote
    
    var style: String {
        switch self {
        case .headline:
            return UIFontTextStyleHeadline
        case .body:
            return UIFontTextStyleBody
        case .footnote:
            return UIFontTextStyleFootnote
        }
    }
    
}


//
// Lazy Stored Properties
// initial value of lazy stored property is "not calculated" until the first time that we call it on an instance.
// CANNOT be a constant (let) property.
import Foundation
class ReadItLaterNetworkingClient {
    lazy var session: URLSession = URLSession(configuration: .default)
}
