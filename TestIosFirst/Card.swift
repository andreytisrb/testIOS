//
//  Card.swift
//  TestIosFirst
//
//  Created by Андрей Тищенко on 04.01.2019.
//  Copyright © 2019 Me. All rights reserved.
//

import Foundation

struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var idFactory = 0
    static func getUniqId() -> Int{
        idFactory += 1
        return idFactory
    }
        
    init(){
        self.identifier = Card.getUniqId()
    }
}
