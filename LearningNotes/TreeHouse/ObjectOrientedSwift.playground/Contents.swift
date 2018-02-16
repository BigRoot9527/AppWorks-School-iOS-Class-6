struct Point {
    let x: Int
    let y: Int
}
let p1 = Point(x: 0,y: 0)
let x = 3
let y = Point(x: 9, y: 0)



struct Person {
    let firstName: String
    let lastName: String
    init (firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
    func fullName() -> String{
        let fullName = firstName + " " + lastName
        return fullName
    }
}

let me = Person(firstName: "Jeremiah", lastName: "Hsu")
me.fullName()

let you = Person(firstName: "Celesta", lastName: "Tang")
you.fullName()


struct RGBColor {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
    
    let description: String
    
    // Add your code below
    init (red: Double, green: Double, blue: Double, alpha: Double){
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
        self.description = "red: \(red), green: \(green), blue: \(blue), alpha: \(alpha)"
    }

}

let aColor = RGBColor(red: 56.2, green: 34.2, blue: 2.1, alpha: 3)
aColor.description

