//
//  Card.swift
//  Concentration
//
//  Created by Amarildo Zeneli on 2/8/18.
//  Copyright © 2018 Amarildo Zeneli. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    init(identifier: Int) {
        self.identifier = identifier
    }
}
