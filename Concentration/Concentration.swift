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

    var indexOfOneAndOnlyOneFaceUpCard: Int? {
        get {
            // look at all the cards and see if you find only one that's face up
            // if so, return it, else return nil
            var foundIndex: Int? = nil
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {  // if found one
                        foundIndex = index
                    } else {  // else, second face up card
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set(newValue) {
            // turn all the cards face down except the card at index newValue
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
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
                }
            } else {
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
