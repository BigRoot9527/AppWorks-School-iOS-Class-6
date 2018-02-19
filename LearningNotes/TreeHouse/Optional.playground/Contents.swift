let movieDictionary = ["Spectre": ["cast": ["Daniel Craig", "Christoph Waltz", "Léa Seydoux", "Ralph Fiennes", "Monica Bellucci", "Naomie Harris"]]]

var leadActor: String = ""

// Enter code below


if let spectre = movieDictionary["Spectre"], let cast = spectre["cast"]{
    leadActor = cast[0]
}

//Downside to using If Let

struct Friend{
    let name: String
    let age: String
    let address: String?
}


func new(friendDictionary: [String:String]) -> Friend? {
    if let name = friendDictionary["name"], let age = friendDictionary["age"] {
        let address = friendDictionary["adress"]
        return Friend(name: name, age: age, address: address)
    } else {
            return nil
    }
        
}

//Early Exit

func newFriend(friendDictionary: [String:String]) -> Friend?{
    guard let name = friendDictionary["name"], let age = friendDictionary["age"] else {
        return nil
    }
        let address = friendDictionary["adress"]
        return Friend(name: name, age: age, address: address)
    }


//


struct Book {
    let title: String
    let author: String
    let price: String?
    let pubDate: String?
    
    init? (dict: [String : String] ){
        guard let title = dict["title"], let author = dict["author"] else {
            return nil
        }
        self.title = title
        self.author = author
        self.price = dict["price"]
        self.pubDate = dict["pubDate"]
    }
    
}
