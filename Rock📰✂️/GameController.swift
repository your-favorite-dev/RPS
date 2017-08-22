//
//  GameController.swift
//  Rock📰✂️
//
//  Created by Romear, Andrew on 8/21/17.
//  Copyright © 2017 AppVile. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    
    var gamePick: GameLogic.Pick!
    var userPick: GameLogic.Pick!
    let gameLogic = GameLogic()
    
    @IBOutlet weak var gameResultPictureViewer: UIImageView!
    @IBOutlet weak var gameResultLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    
    struct Labels {
        static let win = "Player wins!"
        static let lose = "Player loses \u{1F615}"
    }
    
    @IBAction func returnToMain(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func getResults() -> GameLogic.GameStatus{
        
        let user = gameLogic.gamePicks[userPick.rawValue]
        let game = gameLogic.gamePicks[gamePick.rawValue]
        
        setGameStatusLabel(text: "You: \(user) vs. Them: \(game)")
        
        if(nil == userPick || nil == gamePick){
            gameLogic.showAlert(title: "Unkown choice", message: "please choose, rock, paper or scissors", controller: self)
        }
        return gameLogic.gameResult(gamePick: gamePick!, userPick: userPick!)
    }
    
    func setPictureView(image: UIImage){
        self.gameResultPictureViewer.image = image
    }
    func setGameResultLabel(text: String){
        self.gameResultLabel.text = text
    }
    func setGameStatusLabel(text: String){
        self.gameStatusLabel.text = text
    }
    
    func rockWinner(){
        let image = gameLogic.getImage(name: "RockCrushesScissors")
        setPictureView(image: image)
        gameResultLabel.text = userPick == GameLogic.Pick.rock ? Labels.win : Labels.lose
    }
    
    func paperWinner(){
        let image = gameLogic.getImage(name: "PaperCoversRock")
        setPictureView(image: image)
        gameResultLabel.text = userPick == GameLogic.Pick.paper ? Labels.win : Labels.lose
    }
    
    func scissorWinner(){
        let image = gameLogic.getImage(name: "ScissorsCutPaper")
        setPictureView(image: image)
        gameResultLabel.text = userPick == GameLogic.Pick.scissors ? Labels.win : Labels.lose
    }

}
