import Foundation

class Dwarf: Hero {
    
	init(name: String) {
		super.init(type: .dwarf, name: name, weapons: "Axe", healthPoints: 60, attack: 40)
	}
}
