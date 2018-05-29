//
//  Card.swift
//  Concentration
//
//  Created by Denielle Kirk Abaquita on 3/7/18.
//  Copyright © 2018 Denielle Kirk Abaquita. All rights reserved.
//

import Foundation

// * How Cards Behave *
// struct's have no inheritances, making them simpler than classes
// struct's are value types (gets copied in assignments), classes are reference types
// free init initiliazes all variables compared to classes

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0;
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
