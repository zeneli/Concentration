//
//  ViewController.swift
//  Concentration
//
//  Created by Amarildo Zeneli on 2/2/18.
//  Copyright © 2018 Amarildo Zeneli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {  // read-only property
        get {
            return (cardButtons.count + 1) / 2
        }
    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }

    private func updateViewFromModel() {
        // Go through all the cards, look at the game, and set it up appropriately.
        for index in cardButtons.indices {
            let button = cardButtons[index]  // a view object
            let card = game.cards[index]    // a model object
            if card.isFaceUp {  // update the view according to the model object
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮"]

    private var emoji = Dictionary<Int, String>()

    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {  // just in time load the emoji dictionary
            if emojiChoices.count > 0 {  // guard against no emoji's left in dictionary
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        print("emoji for card \(card.identifier) is \(emoji[card.identifier] ?? "?")")

        // return emoji of the card identifier if its not nil, otherwise "?"
        return emoji[card.identifier] ?? "?"
    }
}
