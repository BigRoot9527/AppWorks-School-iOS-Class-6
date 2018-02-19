//some syntaical sugar

enum Coin : Double {
    case penny = 0.01
    case nickel = 0.05
    case dime = 0.1
    case quarter = 0.25
}

let wallet: [Coin] = [.penny, .nickel, .quarter, .dime, .dime, .penny, .quarter, .dime, .dime, .nickel, .quarter, .dime, .quarter, .penny, .dime, .penny, .nickel, .quarter, .nickel, .dime, .nickel, .penny, .dime, .dime, .dime, .quarter]

var count = 0
for coin in wallet {
    switch coin {
    case .quarter :
        count += 1
    default:
        continue
    }
}
// same behavior below
count = 0
for case .quarter in wallet{
    count += 1
}

for coin in wallet{
    if case .penny = coin{
        print("0.01 only")
    }else if case .nickel = coin{
        print("Still 0.05")
    }
}

//unwrap optional by some case

let someOptioanl : Int? = 87

if case .some(let x) = someOptioanl{
    print(x)
}

//Note : optional as enum
enum Optional<T> {
    case some(T)
    case none
}

//
//Nil Coalescing Operator

let firstName: String? = "Jeremiah"
let userName = "BigRoot"
//Question? Answer1:Answer2
//bad example//let displayName = firstName != nil ? firstName! : userName
//benefit v.s. if let: displayName is constant
//better example
let displayName = firstName ?? userName
//type of right hand side (userName: String) must match the "unwrapped" type of left hand side(firstName: String?)
print(displayName)

