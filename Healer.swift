import Foundation

class Healer: Hero{
    
    var heal : Int
    
    init(heal: Int) {
        self.heal = heal
        super .init(weapons: "Book of Wisdom", healthPoints: 70, attack: 10)
    }
}

