//
//  GameLogic.swift
//  Rock📰✂️
//
//  Created by Romear, Andrew on 8/21/17.
//  Copyright © 2017 AppVile. All rights reserved.
//

import UIKit

class GameLogic {
    //Rock, Paper, Scissors
    let gamePicks = ["\u{26F0}", "\u{1F4F0}", "\u{2702}"]
    enum GameStatus {
        case winner,loser,tie
    }
    enum Pick: Int{
        case rock, paper, scissors
    }
    
    func rpsRandomNumber() -> Int{
        let gameChoice = arc4random_uniform(3)
        return Int(gameChoice)
    }
    
    func navigateToRock(sender: UIViewController){
        let destination: RockController;
        destination = sender.storyboard?.instantiateViewController(withIdentifier: "rockController") as! RockController
        setGameChoice(destination)
        sender.present(destination, animated: true, completion: nil)
    }
    
    func setGameChoice(_ destination: GameController){
        let randomNum = rpsRandomNumber()
        destination.gamePick = Pick(rawValue: randomNum)
    }
    
    func getImage(name: String) -> UIImage{
        let image = UIImage(named: name)
        return image!
    }
    
    func showAlert(title: String, message: String, controller: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
    func gameResult(gamePick:Pick, userPick:Pick) -> GameStatus{
        var result = GameStatus.tie
        
        if(gamePick == userPick){
            return result
        }
        
        switch gamePick {
        case .rock:
            result = Pick.paper == userPick ? GameStatus.winner : GameStatus.loser
            break
        case .paper:
            result = Pick.scissors == userPick ? GameStatus.winner : GameStatus.loser
            break
        case .scissors:
            result = Pick.rock == userPick ? GameStatus.winner : GameStatus.loser
            break
        }
        return result
    }
    
}
