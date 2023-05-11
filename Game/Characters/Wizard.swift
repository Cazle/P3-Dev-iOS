import Foundation

class Wizard: Character{
    
    init(name: String){
        super .init(name: name, weapons: "Magic Wand", healthPoints: 80, damage: 20, heal: 10, shield: 0)
    }
}
