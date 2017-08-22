//
//  ScissorController.swift
//  Rock📰✂️
//
//  Created by Romear, Andrew on 8/21/17.
//  Copyright © 2017 AppVile. All rights reserved.
//

import UIKit

class ScissorController: GameController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPick = GameLogic.Pick.scissors
        scissorResult()
    }
    
    func scissorResult(){
        let result = self.getResults()
        if(result == .winner){
            self.scissorWinner()
        }else if(result == .loser){
            self.rockWinner()
        }
    }
    
}
