//
//  Concentration.swift
//  Concentration
//
//  Created by Denielle Kirk Abaquita on 3/7/18.
//  Copyright © 2018 Denielle Kirk Abaquita. All rights reserved.
//

import Foundation

// gets free init (constructor) if initiliazed variables

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?   // an optional because it could not be set
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil   // now there are two matched cards, so set to nil for next check
                
            } else {
                // either no cards or 2 cards are face up, turn all cards face down
                for flipDownIndex in cards.indices {        // countable range, goes through entire list of cards
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards
        {        // ..< means exclusive of upper and ... means inclusive of upper
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
        
    }
}
