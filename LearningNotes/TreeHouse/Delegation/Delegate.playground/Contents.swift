import Foundation

// protocol 去定義要做的事，conform protocol 的 class 要去實作
// :class -> 只給 class 用的 protocol
protocol 工具人守則: class {
    func 買麥當勞()
}

// 公主相當於 Manager / Model 的角色
class 公主 {
    
    static let shared = 公主() // 做一個 singleton，代表唯一的公主
    weak var delegate: 工具人守則? // 公主會叫 delegate 去做事
    //weak to prevent reference cycle
    //only classes can be at the end of a weak relationship, but we can still pass in a struct instance as a stored property thereby violating this agreetment of having a weak relationship (so protocal should be class bounded).
    
    func 肚子餓() {
        self.delegate?.買麥當勞()
    }
}

// 工具人相當於 ViewController 的角色
class 工具人: 工具人守則 {

    let name: String
    
    init(name: String) {
        self.name = name
        公主.shared.delegate = self // 設定自己是公主的 delegate (工具人)
    }
    
    func 打電話給公主() {
        公主.shared.肚子餓() // 只要公主肚子餓，工具人一定會去買麥當勞
    }
    
    // 遵從 工具人守則，所以要去買麥當勞
    func 買麥當勞() {
        print("\(name)買麥當勞送到公主家")
    }
    
}

// 範例
let 庭瑋 = 工具人(name: "庭瑋")
庭瑋.打電話給公主()
