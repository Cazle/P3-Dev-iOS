import Foundation

class Hero {

	enum HeroType: String, CaseIterable {
		case warrior = "Warrior"
		case wizard = "Wizard"
		case thief = "Thief"
		case healer = "Healer"
		case dwarf = "Dwarf"
	}
	
	let type: HeroType
    var name: String
    var weapons: String
    var healthPoints : Int
    var attack: Int
    
	init(type: HeroType, name: String, weapons: String, healthPoints: Int, attack: Int) {
		self.type = type
		self.name = name
        self.weapons = weapons
        self.healthPoints = healthPoints
        self.attack = attack
    }
	
	func userDescription() -> String {
		"\(name) - \(healthPoints) HP armed with \(weapons) which does \(attack) damage!"
	}
	
    func attack(target: Hero){
        target.healthPoints -= attack
    }
}
