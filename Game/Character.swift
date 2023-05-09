import Foundation


class Character{
    
    
    var name: String
    var weapons: String
    var healthPoints: Int
    var damage: Int
    var heal: Int
    
    init(name: String, weapons: String, healthPoints: Int, damage: Int, heal: Int) {
        self.name = name
        self.weapons = weapons
        self.healthPoints = healthPoints
        self.damage = damage
        self.heal = heal    
    }
    
    func heroDescription() -> String{
        "\(name), has a \(weapons) who deal \(damage) damage, and have \(healthPoints) HP."
    }
}
