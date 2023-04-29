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
        print("The game is starting.")
        makingTeams(for: players)
    }
    
    func makingTeams(for players: [Player]){
        print("Players, get ready.")
        
        for currentPlayer in players {
            createOneTeam(for: currentPlayer)
        }
    }
    func createOneTeam(for player: Player){
        print("\(player.name), choose")
        
        while player.heroes.count < maxHeroesPerPlayer{
            let creatingHero = createHero()
            player.heroes.append(creatingHero)
        }
    }
    func askName() -> String{
        print("Print, enter a name for your hero.")
        var heroName = ""
        
        while heroName.isEmpty{
            guard let newName = readLine(), !newName.isEmpty else{
                print("Please, you must write a name")
                continue
            }
            if heroName == newName{
                print("This name is already taken, chose an other one.")
                
            }else{
                heroName.append(newName)
            }
        }
        return heroName
    }
    
    func createHero() -> Hero{
        
        print("""
             1 : Warrior
             2 : Wizard
             3 : Thief
             4 : Dwarf
             5 : Healer
             """)
        let newHero = readLine()
        
        switch newHero {
        case "1":
            askName()
            return Warrior(name: "")
        case "2":
            return Dwarf(name: "")
        case "3":
            return Thief(name: "")
        case "4":
            return Wizard(name: "")
        case "5":
            return Healer(name: "", heal: 20)
        default: print("You must choose between 1 and 5")
        }
        return createHero()
    }
}
        
    
   
    // TODO: Fonction pour deux équipes de deux joueurs, et leur mettre une limite de héros
    // TODO: Fonction pour demander le nom du héro, pour chaque joueur et faire en sorte qu'il ait rempli quelque chose, et que ce nom n'existe pas
    // TODO: Fonction pour choisir ces heros, et appeler la fonction précedente pour ajouter le nom au héro.
    
