import Foundation


class Hero{
    
    var names: [String] = []
    var weapons: String
    var healthPoints : Int
    var attack: Int
    
    init(weapons: String, healthPoints: Int, attack: Int) {
        self.weapons = weapons
        self.healthPoints = healthPoints
        self.attack = attack
    }
    func attack(target: Hero){
        target.healthPoints -= attack
    }
}
