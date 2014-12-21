//
//  EndViewController.swift
//  Bubbles
//
//  Created by Rhed Shi on 12/21/14.
//  Copyright (c) 2014 Rhed Shi. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "\(score)"
    }
    
    func updateScore(score: Int) {
        self.score = score
    }

}
