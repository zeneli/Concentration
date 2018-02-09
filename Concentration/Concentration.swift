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
    
    func chooseCard(at index: Int) {
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for identifier in 0..<numberOfPairsOfCards {
            let card = Card(identifier: identifier)
            let matchingCard = card
            cards.append(card)
            cards.append(matchingCard)
        }
        // TODO: shuffle cards
        // for current in 0..<numberOfPairsOfCards {
        //     rand = generate random number
        //     swap(cards[current], cards[rand])
    }
}
