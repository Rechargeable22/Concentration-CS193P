//
//  Card.swift
//  Concentration
//
//  Created by Oliver on 27.02.19.
//  Copyright © 2019 OliCorp. All rights reserved.
//

import Foundation

//struct is like a card bus has no inheritance; It's value type, whereas classes are reference types; It get copied when referenced
struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
