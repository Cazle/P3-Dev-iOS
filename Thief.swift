import Foundation

class Thief: Hero{
    
    init(name: String){
        super .init(name: name, weapons: "Dagger", healthPoints: 70, attack: 30)
    }
}

