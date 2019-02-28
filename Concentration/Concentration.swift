//
//  Concentration.swift
//  Concentration
//
//  Created by Oliver on 27.02.19.
//  Copyright © 2019 OliCorp. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numbersOfPairsOfCards: Int) {
        for _ in 0..<numbersOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                // either no cards or two cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
    
    
}
