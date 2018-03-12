//Value types: structs, enums, arrays and other native types.

// Value Semantics(語意)

struct Point {
    var x: Double
    var y: Double
}

var p1 = Point(x: 1, y: 2)
var p2 = p1

p1.x = 4
p2.x
//p2.x unchanged because a value type is copied on assignment.

let p3 = Point(x: 2, y: 4)
//we cannot change the value assigned to the constant.

