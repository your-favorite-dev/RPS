//
//  RockController.swift
//  Rock📰✂️
//
//  Created by Romear, Andrew on 8/21/17.
//  Copyright © 2017 AppVile. All rights reserved.
//

import UIKit

class RockController: GameController {
    override func viewDidLoad() {
        super.viewDidLoad()
        userPick = GameLogic.Pick.rock
        rockResult()
    }
    
    func rockResult(){
        let result = self.getResults()

        if(result == .winner){
            self.rockWinner()
        }else if(result == .loser){
            self.paperWinner()
        }
    }
}
