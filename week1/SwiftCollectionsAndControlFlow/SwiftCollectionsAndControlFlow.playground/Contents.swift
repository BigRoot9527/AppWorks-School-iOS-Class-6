//Week1 - Swift Collections and Control Flow

// - Array - //

//1.
var myFriends:[String] = []

//2.
myFriends += ["Ian", "Bomi", "Kevin"]

//3.
myFriends.append("Michael")

//4.
myFriends.remove(at: 2)
myFriends.insert("Kevin", at: 0)

//5.
for friend in myFriends{
    print(friend)
}

//6.
/*there is no one at index 5,
since "print(myFriends[5])" will cause an error for "out of range" */

// - Dictionary - //

//1.
var myCountryNumber = [String:Int]()

//2.
myCountryNumber["US"] = 1
myCountryNumber["GB"] = 44
myCountryNumber["JP"] = 81

//3.
myCountryNumber.removeValue(forKey: "US")

//4.
myCountryNumber["GB"] = 0

//5.

for (country, num) in myCountryNumber{
    
    print("key:\(country),value:\(num)")
    
}

// - For,While,Repeat -

//1.
for friend in myFriends{
    print(friend)
}
for (country, num) in myCountryNumber{
    
    print("key:\(country),value:\(num)")
    
}

//2.
let lottoNumbers = [10, 9, 8, 7, 6, 5]

for num in (lottoNumbers.count-3)...(lottoNumbers.count-1){
    print(lottoNumbers[num])
}

//3.
for increase in 5...10{
    print(increase)
}
for decrease in 0...2{
    print(10 - decrease*2)
}

//4.
var count = 5
while count <= 10 {
    print(count)
    count += 1
}
count = 10
while count >= 6 {
    print(count)
    count -= 2
}

//5.
count = 5
repeat{
    print(count)
    count += 1
}while count <= 10

count = 10
repeat{
    print(count)
    count -= 2
}while count >= 6

// - If statement - //

//1.
var isRaining = "raining"
if isRaining == "raining" {
    print("It's \(isRaining). I don't want to work today.")
}else{
    print("Although It's \(isRaining).I still don't want to work today.")
    
}

// - Switch -

//1.
var jobLevel = 66
switch jobLevel {
case 1:
    print("Member")
case 2:
    print("Team Leader")
case 3:
    print("Manager")
case 4:
    print("Director")
default:
    print("We don't have this job")
}

////////
