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
        startingComposingTeams(for: players)
    }
    // Launch the composition of each player
    func startingComposingTeams(for players: [Player]){
        for player in players {
            createHero(for: player)
            startBattle()
            
            // resume the team for the player
            for resume in player.characters{
                print("\(resume.heroDescription())")
            }
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
                    var hasFoundADuplicate = false
                    
                    for character in allCharacters {
                        if character.name == newName{
                            hasFoundADuplicate = true
                            break
                        }
                    }
                    
                    if !hasFoundADuplicate{
                        name = newName
                    } else {
                        print("               ")
                        print("⚠️ This name is already taken. ⚠️")
                        print("                ")
                    }
                }
                else{
                    print("⚠️ You must write a name. ⚠️")
                }
            }
            return name
        }
        // Function to make sur that the player chose between one and five
        func askHero() -> Int{
            
            print("""
        1. Warrior ⚔️
        2. Dwarf ⛏️
        3. Thief 🥷
        4. Wizard 🧙‍♂️
        5. Healer 🧝🏼‍♂️
        """)
            let characterChoice = readLine()
            
            switch characterChoice{
            case "1":
                return 1
            case "2":
                return 2
            case "3":
                return 3
            case "4":
                return 4
            case "5":
                return 5
            default: print("You must choose between 1 and 5.")
            }
            return askHero()
        }
        
        // The player chose a hero between the 5 available
        func createHero(for player: Player){
            print("                                         ")
            print("\(player.name), you have to chose 3 heroes.")
            print("                                         ")
        
            while player.characters.count < maxHeroesPerPlayer{
                print("\(player.name), you've got \(player.characters.count + 1) on 3")

                
                let askingHero = askHero()
                let askingName = askName()
                switch askingHero{
                    
                case 1:
                    player.characters.append(Warrior(name: askingName))
                    print("                                         ")
                    print("You chose a Warrior, named \(askingName)")
                    print("                                         ")
                case 2:
                    player.characters.append(Dwarf(name: askingName))
                    print("                                         ")
                    print("You chose a Dwarf, named \(askingName)")
                    print("                                         ")
                case 3:
                    player.characters.append(Thief(name: askingName))
                    print("                                         ")
                    print("You chose a Thief, named \(askingName)")
                    print("                                         ")
                case 4:
                    player.characters.append(Wizard(name: askingName))
                    print("                                         ")
                    print("You chose a Wizard, named \(askingName)")
                    print("                                         ")
                case 5:
                    player.characters.append(Healer(name: askingName, heal: 20))
                    print("                                         ")
                    print("You chose a Healer, named \(askingName)")
                    print("                                         ")
                default: print("you have to chose between 1 and 5")
                }
            }
        }
        func startBattle(){
            print("                  ")
            print("Entering battle phase.")
            
            }
        func selectCharacter() -> Character{
                    print("Je suis la fonction combat")
                    for player in players {
                        print("\(player.name), you have to chose between your 3 characters")
                        
                        print("\(player.characters.forEach{print($0)})")
                }
                return selectCharacter()
            }
    }
    





