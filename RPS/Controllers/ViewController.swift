//
//  ViewController.swift
//  RPS
//
//  Created by Charday Neal on 1/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var computerSignLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    //player game options
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    fileprivate var gameStatus: GameState?
    fileprivate var computerChoice: Sign?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI(.start)
    }

    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        //update interface to reset game to play again
        updateUI(.start)
    }
    
    
    @IBAction func optionButtonPressed(_ sender: UIButton) {
        //display player choice
        let playerChoice = sender.titleLabel?.text
        
        sender.layer.borderColor = CGColor(gray: 1, alpha: 1)
        sender.layer.borderWidth = 3
        sender.layer.cornerRadius = 15
        
       
        
        //display random computerChoice in label
        computerChoice = randomSign()
        
        switch computerChoice {
        case .rock:
            computerSignLabel.text = "👊🏾"
            break
        case .paper:
            computerSignLabel.text = "🖐🏾"
            break
        case .scissors:
            computerSignLabel.text = "✌🏾"
            break
        case nil:
            print("Error getting computer choice label")
        }
        
        //call play method in sign enum based on players selection
        if playerChoice == "👊🏾" {
            gameStatus = Sign.rock.play(computerChoice!)
        } else if playerChoice == "🖐🏾" {
            gameStatus = Sign.paper.play(computerChoice!)
        } else {
            gameStatus = Sign.scissors.play(computerChoice!)
        }
        
        //update interface to reflect results of play method
        updateUI(gameStatus!)
        playAgainButton.isHidden = false
    }
    
    //update interface to display that player has completed a round of rps
    func updateUI(_ gameStatus: GameState) {

        // display respective text and color based on gameStatus enum value
        switch gameStatus {
        case .start:
            mainView.backgroundColor = .white
            gameStatusLabel.text = "Select a button"
            computerSignLabel.text = "🤖"
            
            //reset player buttons
            resetButtons()
            break
        case .win:
            mainView.backgroundColor = .green
            gameStatusLabel.text = "You Win!"
            break
        case .lose:
            mainView.backgroundColor = .red
            gameStatusLabel.text = "You Lose!"
            break
        case .draw:
            mainView.backgroundColor = .blue
            gameStatusLabel.text = "It's a tie."
            break
        }
        
    }
    
    //resets player buttons and play again button to default
    func resetButtons() {
        playAgainButton.isHidden = true
        
        rockButton.isEnabled = true
        rockButton.layer.borderWidth = 0
        
        paperButton.isEnabled = true
        paperButton.layer.borderWidth = 0
        
        scissorsButton.isEnabled = true
        scissorsButton.layer.borderWidth = 0
    }
}

