import Foundation

class Healer: Character{
    
    var heal : Int
    
    init(name: String, heal: Int) {
        self.heal = heal
        super .init(name: name, weapons: "Book of Wisdom", healthPoints: 70, damage: 0)
    }
    override func heroDescription() -> String {
        "\(name), has a \(weapons) who deal \(damage) damage, has \(healthPoints) HP, and can heal allies HP by \(heal)"    }
}

