import Foundation

class Warrior: Character {
    init(name: String) {
        super .init(name: name, weapons: "Sword", healthPoints: 100, damage: 20, heal: 10, shield: 0)
    }
}
