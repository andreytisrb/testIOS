//
//  Concentration.swift
//  TestIosFirst
//
//  Created by Андрей Тищенко on 04.01.2019.
//  Copyright © 2019 Me. All rights reserved.
//

import Foundation

class Concentation{
    private (set) var cards = [Card]()
    private (set) var inedexOfOneAndOnlyFaceUpCard: Int?{
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index),"Concentation.chooseCard(at: \(index) aaa")
        if !cards[index].isMatched{
            if let matchIdex = inedexOfOneAndOnlyFaceUpCard, matchIdex != index{
                if cards[matchIdex].identifier == cards[index].identifier {
                    cards[matchIdex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }
            else{
                inedexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards>0, "Concentarion can not use the number of cards \(numberOfPairsOfCards)")
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards+=[card, card]
        }
        cards.shuffle()
    }
}
