//
//  ViewController.swift
//  Concentration
//
//  Created by gem on 11/27/17.
//  Copyright © 2017 beau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var emojiChoices = [String]()
    @IBAction func startNewGame(_ sender: Any) {
        flipCount = 0
        self.emojiChoices = ["🤪", "🤯", "🤮", "🤩", "🧐", "🤫", "🤥", "😱"]
        self.game = Concentration(numberOfPairs: (cardButtons.count + 1) / 2)
        updateViewFromModel()
    }
    lazy var game = Concentration(numberOfPairs: (cardButtons.count + 1) / 2)
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flip Count: \(flipCount)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            flipCount += 1
            updateViewFromModel()
            print("\(String(describing: cardNumber))")
        }
    }
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .clear
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .blue
            }
        }
    }
    

    private var emoji = [Card: String]()
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card] ?? "?"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startNewGame(true)
    }
}

