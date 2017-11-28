//
//  Concentration.swift
//  Concentration
//
//  Created by gem on 11/27/17.
//  Copyright © 2017 beau. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var indexOfOneCardFacedUp: Int?
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneCardFacedUp, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneCardFacedUp = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneCardFacedUp = index
            }
        }
    }
    init(numberOfPairs pairs: Int) {
        for _ in 0..<pairs {
            let card = Card()
            let matchingCard = card // Struct makes a copy
            cards.append(card)
            cards.append(matchingCard)
        }
        shuffleCards()
    }
    func shuffleCards() {
        cards.shuffle()
    }
}
/*
 https://github.com/raywenderlich/swift-algorithm-club/tree/master/Shuffle
*/
public func random(_ n: Int) -> Int {
    return Int(arc4random_uniform(UInt32(n)))
}

extension Array {
    /*
     Randomly shuffles the array in-place
     This is the Fisher-Yates algorithm, also known as the Knuth shuffle.
     Time complexity: O(n)
     */
    public mutating func shuffle() {
        
        // for index in the range (arrayLength-1 through 1) //counting backwards
        for index in (1...self.count-1).reversed() {
            // j = random integer + 1
            let j = random(index + 1)
            // if index is not equal to our random index
            if index != j {
                // t is the value at the index of i
                let t = self[index]
                // set the value at index i to the value found at index j
                self[index] = self[j]
                // the value at index j is now t
                self[j] = t
            }
        }
    }
}

