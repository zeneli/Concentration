//
//  ViewController.swift
//  Concentration
//
//  Created by Amarildo Zeneli on 2/2/18.
//  Copyright © 2018 Amarildo Zeneli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Concentration(numberOfPairsOfCards: 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }

    func updateViewFromModel() {
        // Go through all the cards, look at the game, and set it up appropriately.
        for index in cardButtons.indices {
            let button = cardButtons[index]  // a view object
            let card = game.cards[index]    // a model object
            if card.isFaceUp {  // update the view according to the model object
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🎃", "👻", "🎃", "👻"]

    func emoji(for card: Card) -> String {
        return "?"
    }
}
