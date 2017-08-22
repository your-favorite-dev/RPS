//
//  PaperController.swift
//  Rock📰✂️
//
//  Created by Romear, Andrew on 8/21/17.
//  Copyright © 2017 AppVile. All rights reserved.
//

import UIKit

class PaperController: GameController {

    override func viewDidLoad() {
        super.viewDidLoad()
        userPick = GameLogic.Pick.paper
        paperResult()
    }

    func paperResult(){
        let result = self.getResults()
        if(result == .winner){
            self.paperWinner()
        }else if(result == .loser){
            self.scissorWinner()
        }
    }
}
