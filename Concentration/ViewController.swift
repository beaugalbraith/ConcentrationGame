//
//  ViewController.swift
//  Concentration
//
//  Created by gem on 11/27/17.
//  Copyright © 2017 beau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount: Int = 0
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "🤯", on: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColor.blue
            
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = UIColor.white
        }
        flipCount += 1
    }

}

