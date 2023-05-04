import Foundation


class Character{
    
    
    var name: String
    var weapons: String
    var healthPoints: Int
    var damage: Int
    
    init(name: String, weapons: String, healthPoints: Int, damage: Int) {
        self.name = name
        self.weapons = weapons
        self.healthPoints = healthPoints
        self.damage = damage
    }
    
    func heroDescription() -> String{
        "\(name), has a \(weapons) who deal \(damage) damage, and have \(healthPoints) HP."
    }
    func attack(attacking: Character, team: Player){
        for hero in team.characters{
            if hero.healthPoints > 0{
                attacking.healthPoints -= attacking.damage
            }
        }
    }
    func checkingHealthPointCharacter(of: Character, team: Player){
        for currentHero in team.characters{
            if currentHero.healthPoints == 0{
                
            }
        }
    }
}
