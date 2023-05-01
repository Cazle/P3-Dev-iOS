import Foundation


class Characters{
    
    
    var name: String
    var weapons: String
    var healthPoints: Int
    var attack: Int
    
    init(name: String, weapons: String, healthPoints: Int, attack: Int) {
        self.name = name
        self.weapons = weapons
        self.healthPoints = healthPoints
        self.attack = attack
    }
    func attack(target: Characters){
        target.healthPoints -= attack
    }
    func heroDescription() -> String{
        "\(name), has a \(weapons) who deal \(attack) damage, and have \(healthPoints) HP."
    }
}
