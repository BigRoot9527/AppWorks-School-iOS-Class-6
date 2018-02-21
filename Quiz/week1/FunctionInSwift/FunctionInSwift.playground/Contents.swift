//Week1 - Function in Swift

//1.
func greet(person name: String) -> String {
    return "Hello, \(name)."
}
print(greet(person: "BigRoot"))

//2.
func multiply(num1 a: Double, num2 b: Double = 10){
    print("\(a) * \(b) is equal to \(a * b)")
}
multiply(num1: 3.5 , num2: 19)
