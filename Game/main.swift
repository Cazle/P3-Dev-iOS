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
    
    // Variable to handle our two players
    var players: [Player] {
        return [playerOne, playerTwo]
    }
    
    var maxHeroesPerPlayer = 3
    
    func startGame(){
        print("The game is starting")
        startingComposingATeam(for: players)
    }
    // Launch the composition of each player
    func startingComposingATeam(for players: [Player]){
        for player in players {
            askHero(for: player)
            
            // resume the team for the player
            for resume in player.characters{
                print("\(resume.heroDescription())")
            }
        }
        
        // Control if the name is unique and make sure that the player has written a name
        func askName() -> String{
            print("                                 ")
            print("Enter a name for your character :")
            print("                                 ")
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
                else{
                    print("You must write a name.")
                }
            }
            return name
        }
        // The player chose a hero between the 5 available
        func askHero(for player: Player){
            print("                                         ")
            print("\(player.name), you have to chose 3 heroes.")
            print("                                         ")
        
            while player.characters.count < maxHeroesPerPlayer{
                print("\(player.name), you've got \(player.characters.count + 1) on 3")
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
                    print("You chose a Dwarf, named \(askingName)")
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
            
            let numberOfTurn = 0
            
            print("                  ")
            print("                  ")
            print("Entering battle phase.")
            
            for _ in players {
                selectCharacter()
            }
        }
        func selectCharacter(){
            print("Je suis la fonction combat")
            for player in players {
                print("\(player.name), you have to chose between your 3 characters")
                
                print("\(player.characters.forEach{print($0)})")
                }
            }
        }
        
    }





