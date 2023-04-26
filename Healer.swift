import Foundation

class Healer: Hero {
    
    var heal: Int
    
	init(name: String) {
		heal = 10
		
		super.init(type: .healer, name: name, weapons: "Book of Wisdom", healthPoints: 70, attack: 0)
	}
}

