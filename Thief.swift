import Foundation

class Thief: Hero {
    
	init(name: String) {
		super.init(type: .thief, name: name, weapons: "Dagger", healthPoints: 70, attack: 30)
	}
}
