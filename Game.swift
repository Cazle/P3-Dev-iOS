import Foundation

class Game {
	
	// Main menu, with 2 options, one to start the game, the other to exit the game.
	func startingTheGame() {
		print("Welcome to the new game of FrenchGame company !")
		
		while true {
			print("""
	  Please select one option.
	  1 : Start game
	  2 : Quit game
	 """)
			
			let startMenu = readLine()
			switch startMenu {
				
			case "1" :
				let chooseTeam = GameSession()
				chooseTeam.startGame()
				
			case "2":
				print("Thanks for playing the game. Good bye !")
				exit(0)
				
			default:
				print("I didn't understood, please try again.")
			}
		}
	}
}
