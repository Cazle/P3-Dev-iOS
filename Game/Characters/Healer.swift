import Foundation

class Healer: Character{
    
    
    init(name: String) {
        super .init(name: name, weapons: "Book of Wisdom", healthPoints: 70, damage: 0, heal: 25)
    }
    override func heroDescription() -> String {
        "\(name), has a \(weapons) who can heal allies HP by \(heal). And have \(healthPoints) HP."    }
}

