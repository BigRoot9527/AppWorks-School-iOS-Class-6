struct Point {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    ///Returns the surrounding points in range of
    /// the current one
    func points(inRange range: Int = 1) -> [Point]{
        var results = [Point]()
        
        let lowerBoundOfXRange = x - range
        let upperBoundOfXRange = x + range
        
        let lowerBoundOfYRange = y - range
        let upperBoundOfYRange = y + range
        
        for xCoordinate in lowerBoundOfXRange...upperBoundOfXRange{
            for yCoordinate in lowerBoundOfYRange...upperBoundOfYRange{
                let coordinatePoint = Point(x: xCoordinate, y: yCoordinate)
                results.append(coordinatePoint)
            }
        }
        
        return results
    }
}

class Enemy {
    var life: Int = 2
    let position: Point
    
    init(x: Int, y: Int){
        self.position = Point(x: x, y: y)
    }
    func decreaseLife(by factor:Int){
        life -= factor
    }

}

class SuperEnemy: Enemy{
    let isSuper: Bool = true
    
    override init(x: Int, y: Int) {
        super.init(x: x, y: y)
        self.life = 50
    }
}

class Tower {
    let position: Point
    var range: Int = 1
    var strength: Int = 1
    
    init(x: Int, y: Int) {
        self.position = Point(x: x, y: y)
    }
    
    func isInRange(of enemy: Enemy) -> Bool{
        let availablePosition = position.points(inRange: range)
        
        for point in availablePosition {
            if point.x == enemy.position.x && point.y == enemy.position.y{
                return true
            }
        }
        return false
    }
    
    func fire(at enemy: Enemy){
        if isInRange(of: enemy){
            enemy.decreaseLife(by: strength)
            print("Gotcha")
        } else {
            print("Darn! Out of range!")
        }
    }
    
}

class LaserTower: Tower{
    
    override init(x: Int, y: Int) {
        super.init(x: x, y: y)
        self.range = 100
        self.strength = 100
    }
    
    override func fire(at enemy: Enemy) {
        while enemy.life >= 0{
            enemy.decreaseLife(by: strength)
        }
        print("Enemy destroyed!")
    }
}

let tower1 = Tower(x: 0, y: 0)
let tower2 = Tower(x: 3, y: 3)
let enemy1 = Enemy(x: 1, y: 1)
let enemy2 = SuperEnemy(x: 2, y: 5)
let tower3 = LaserTower(x: 30, y: 32)
enemy2.life

tower1.fire(at: enemy1)
tower2.fire(at: enemy1)
tower3.fire(at: enemy2)


