import Foundation

class Wizard: Hero {
    
	init(name: String) {
		super.init(type: .wizard, name: name, weapons: "Magic Wand", healthPoints: 80, attack: 25)
	}
}
