import Foundation

class Thief: Character {
    init(name: String) {
        super .init(name: name, weapons: "Dagger", healthPoints: 70, damage: 30, heal: 10, shield: 0)
    }
}
