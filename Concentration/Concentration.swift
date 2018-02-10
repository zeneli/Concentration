//
//  Concentration.swift
//  Concentration
//
//  Created by Amarildo Zeneli on 2/8/18.
//  Copyright © 2018 Amarildo Zeneli. All rights reserved.
//

import Foundation

class Concentration {
    var cards = Array<Card>()

    // optional since there may not be one card face up at a given time
    var indexOfOneAndOnlyOneFaceUpCard: Int?
    
    // chooseCard is responsible for all cases of the game
    func chooseCard(at index: Int) {
        // if theres one card face up and choose another card, see if they match (where we really do the work)
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyOneFaceUpCard {
                if matchIndex != index {
                    // check if cards match
                    if cards[matchIndex].identifier == cards[index].identifier {
                        cards[matchIndex].isMatched = true
                        cards[index].isMatched = true
                    }
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyOneFaceUpCard = nil
                }
            } else {  // if no cards are faceUp, then flip the card over
                // either no cards, or 2 cards are face up; flip them down (except the chosen card)
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyOneFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        // Initialize cards.
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            let matchingCard = card
            cards.append(card)
            cards.append(matchingCard)
        }

        // Shuffle cards.
        for index in cards.indices {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            let otherCard = cards[randomIndex]
            cards[randomIndex] = cards[index]
            cards[index] = otherCard
        }
    }
}
