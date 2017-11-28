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
                if cards[matchIndex].identifier == cards[index].identifier {
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
        for i in (1...count-1).reversed() {
            let j = random(i + 1)
            if i != j {
                let t = self[i]
                self[i] = self[j]
                self[j] = t
            }
        }
    }
}

 /*
 Simultaneously initializes an array with the values 0...n-1 and shuffles it.
 */
public func shuffledArray(_ n: Int) -> [Int] {
    var a = Array(repeating: 0, count: n)
    for i in 0..<n {
        let j = random(i + 1)
        if i != j {
            a[i] = a[j]
        }
        a[j] = i  // insert next number from the sequence
    }
    return a
}
