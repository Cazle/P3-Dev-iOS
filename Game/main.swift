import Foundation
// "game" is for launching the game.
let game = Game()
game.startingTheGame()

class Game {
    
    // Main menu, with 2 options, one to start the game, the other to exit the game.
    func startingTheGame(){
        print("Welcome to the new game of FrenchGame company !")
        print("""
     Please select one option.
     1 : Start game
     2 : Quit game
    """)
        
        let startMenu = readLine()
        switch startMenu{
            
        case "1" :
            let chooseTeam = GameSession()
            chooseTeam.startGame()
            
            
        case "2":
            print("Thanks for playing the game. Good bye !")
            exit(0)
            
        default:
            print("I didn't understood, please try again.")
            startingTheGame()
        }
    }
}
class GameSession {
    
    // Declare two players with both name
    var playerOne = Player(name: "Player one")
    var playerTwo = Player(name: "Player two")
    
    var players: [Player] {
        return [playerOne, playerTwo]
    }
    
    var maxHeroesPerPlayer = 3
    
    func startGame(){
        print("The game is starting")
        startingComposingATeam(for: players)
    }
    func startingComposingATeam(for players: [Player]){
        for player in players {
            askHero(for: player)
            
            for resume in player.characters{
                print("\(resume.heroDescription())")
            }
        }
        
        
        func askName() -> String{
            print("Enter a name for your character :")
            var name = ""
            let allCharacters = players.flatMap{currentCharacter in currentCharacter.characters}
            while name.isEmpty{
                if let newName = readLine(), !newName.isEmpty{
                    for character in allCharacters {
                        if character.name == newName{
                            print("This name is already taken.")
                            return askName()
                        }
                    }
                    name = newName
                }
                print("You must write a name.")
            }
            return name
        }
        func askHero(for player: Player){
            print("                                         ")
            print("\(player.name), you have to chose 3 heroes.")
            print("                                         ")
        
            while player.characters.count < maxHeroesPerPlayer{
                print("""
            1. Warrior
            2. Dwarf
            3. Thief
            4. Wizard
            5. Healer
            """)
                let askingHero = readLine()
                let askingName = askName()
                switch askingHero{
                    
                case "1":
                    player.characters.append(Warrior(name: askingName))
                    print("                                         ")
                    print("You chose a Warrior, named \(askingName)")
                    print("                                         ")
                case "2":
                    player.characters.append(Dwarf(name: askingName))
                    print("                                         ")
                    print("You chose a Dward, named \(askingName)")
                    print("                                         ")
                case "3":
                    player.characters.append(Thief(name: askingName))
                    print("                                         ")
                    print("You chose a Thief, named \(askingName)")
                    print("                                         ")
                case "4":
                    player.characters.append(Wizard(name: askingName))
                    print("                                         ")
                    print("You chose a Wizard, named \(askingName)")
                    print("                                         ")
                case "5":
                    player.characters.append(Healer(name: askingName, heal: 20))
                    print("                                         ")
                    print("You chose a Healer, named \(askingName)")
                    print("                                         ")
                default: print("you have to chose between 1 and 5")
                }
            }
        }
        var _ = startBattle()
        func startBattle(){
            
            print("                  ")
            print("                  ")
            print("Je suis le combat.")
        }
    }
}



