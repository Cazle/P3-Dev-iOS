import Foundation
// Few declarations for using my classes. "game" is for launching the game, and "hero", is used for naming my characters.
let game = Game()
let hero = Hero(weapons: "", healthPoints: 0, attack: 0)
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
            chooseTeam.makeTeamOne()
            
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
    
    // Function to let both players choose their heroes name for each team.
    func herosNames(){
            print("\(playerOne.name), enter 3 names for your characters.")
            while hero.names.count <= 2 {
                guard let name = readLine(), !name.isEmpty else {
                    print("Please enter a valid name.")
                    continue
                }
                if hero.names.contains(name){
                    print("Please, choose an other name")
                    continue
                }
                hero.names.append(name)
            }
            print("\(playerTwo.name), enter 3 names for your characters.")
            while hero.names.count <= 5 {
                guard let name = readLine(), !name.isEmpty else {
                    print("Please enter a valid name.")
                    continue
                }
                if hero.names.contains(name){
                    print("Please, choose an other name")
                    continue
                }
                hero.names.append(name)
            }
        print("\(hero.names[0]), \(hero.names[1]), \(hero.names[2]), \(hero.names[3]), \(hero.names[4]), \(hero.names[5])")
}

    // Player one has too choose 3 heroes, and he has 5 options. (Each class of the game)
    func makeTeamOne(){
        herosNames()
        while playerOne.heroes.count <= 2{
            print("""
 Player One choose 3 heroes,
 You have \(playerOne.heroes.count) heroes on 3
 1 : Warrior
 2 : Wizard
 3 : Thief
 4 : Dwarf
 5 : Healer
 """)
            let playerOneTeam = readLine()
            
            switch playerOneTeam{
                
            case "1": playerOne.heroes.append(Warrior())
                print("You chose Warrior.")
                
            case "2": playerOne.heroes.append(Wizard())
                print("You chose Wizard.")
                
            case "3": playerOne.heroes.append(Thief())
                print("You chose Thief.")
                
            case "4": playerOne.heroes.append(Dwarf())
                print("You chose Dwarf.")
                
            case "5": playerOne.heroes.append(Healer(heal: 20))
                print("You chose Healer.")
                
            default: print("You must select between 1 and 5.")
            }
        }
    makeTeamTwo()
}
    // Player Two has too choose 3 heroes, and he has 5 options. (Each class of the game)
    func makeTeamTwo(){
        
        while playerTwo.heroes.count <= 2 {
            
            print("""
             Player Two choose 3 heroes,
             You have \(playerTwo.heroes.count) heroes on 3
             1 : Warrior
             2 : Wizard
             3 : Thief
             4 : Dwarf
             5 : Healer
             """)
                    let playerTwoTeam = readLine()
                        
                    switch playerTwoTeam{
                            
                    case "1": playerTwo.heroes.append(Warrior())
                        print("You chose Warrior.")
                            
                    case "2": playerTwo.heroes.append(Wizard())
                        print("You chose Wizard.")
                            
                    case "3": playerTwo.heroes.append(Thief())
                        print("You chose Thief.")
                            
                    case "4": playerTwo.heroes.append(Dwarf())
                        print("You chose Dwarf.")
                            
                    case "5": playerTwo.heroes.append(Healer(heal: 20))
                        print("You chose Healer.")
                            
                    default: print("You must select between 1 and 5.")
                }
            }
        // Now we indicate to both players, what heroes they have and how they are named.
        print("\(playerOne.name), you have a \(type(of: playerOne.heroes[0])) named \(hero.names[0]), a \(type(of: playerOne.heroes[1])) named \(hero.names[1]), and a \(type(of: playerOne.heroes[2])) named \(hero.names[2]).")
        print("\(playerTwo.name), you have a \(type(of: playerTwo.heroes[0])) named \(hero.names[3]), a \(type(of: playerTwo.heroes[1])) named \(hero.names[4]), and a \(type(of: playerTwo.heroes[2])) named \(hero.names[5]).")
    }
}



