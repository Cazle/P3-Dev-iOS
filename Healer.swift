import Foundation

class Healer: Characters{
    
    var heal : Int
    
    init(name: String, heal: Int) {
        self.heal = heal
        super .init(name: name, weapons: "Book of Wisdom", healthPoints: 70, attack: 10)
    }
}

