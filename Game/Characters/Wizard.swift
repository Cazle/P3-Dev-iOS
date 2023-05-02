import Foundation

class Wizard: Characters{
    
    init(name: String){
        super .init(name: name, weapons: "Magic Wand", healthPoints: 80, attack: 25)
    }
}
