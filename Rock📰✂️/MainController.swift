//
//  MainController.swift
//  Rock📰✂️
//
//  Created by Romear, Andrew on 8/21/17.
//  Copyright © 2017 AppVile. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    
    let gameLogic = GameLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func userChoice(_ sender: UIButton){
        
        switch sender.tag {
        case 0:
            gameLogic.navigateToRock(sender: self)
            break
        case 1:
            performSegue(withIdentifier: "paperChoice", sender: self)
        default:
            gameLogic.showAlert(title: "Unkown choice", message: "please choose, rock, paper or scissors", controller: self)
            break
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "paperChoice"){
            let destination = segue.destination as! PaperController
            gameLogic.setGameChoice(destination)
        }else{
            let destination = segue.destination as! ScissorController
            gameLogic.setGameChoice(destination)
        }
        
    }
}

