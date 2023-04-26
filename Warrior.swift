import Foundation

class Warrior: Hero {
	
	init(name: String) {
		super.init(type: .warrior, name: name, weapons: "Sword", healthPoints: 100, attack: 20)
	}
	
	override func userDescription() -> String {
		"LET ME KILL THEM!!!"
	}
}
