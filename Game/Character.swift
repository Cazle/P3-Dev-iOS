import Foundation

class Character {
    var name: String
    var weapons: String
    var healthPoints: Int
    var damage: Int
    var heal: Int
    var shield: Int
    
    init(name: String, weapons: String, healthPoints: Int, damage: Int, heal: Int, shield: Int) {
        self.name = name
        self.weapons = weapons
        self.healthPoints = healthPoints
        self.damage = damage
        self.heal = heal
        self.shield = shield
    }
    
    func heroDescription() -> String {
        "\(name), has \(healthPoints) HP. With a \(weapons), who deal \(damage). Can heal \(heal) HP and have \(shield) level on shield."
    }
}
