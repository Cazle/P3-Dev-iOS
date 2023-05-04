import Foundation

class Wizard: Character{
    
    init(name: String){
        super .init(name: name, weapons: "Magic Wand", healthPoints: 80, attack: 25)
    }
}
