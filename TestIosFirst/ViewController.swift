//
//  ViewController.swift
//  TestIosFirst
//
//  Created by Андрей Тищенко on 03.01.2019.
//  Copyright © 2019 Me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game: Concentation = Concentation(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int{
        return ((cardButtons.count + 1)/2)
    }
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
            
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    var emojiChoice = ["🎃","👻","🎃","👻"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else{
            print("no card")
        }
        
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor =  card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0): #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiMas = ["🐧","🦂","🕷","👻","🎃", "👿"]
    private var emoDict = [Int: String]()
    
    func emoji(for card: Card) -> String{
        if emoDict[card.identifier] == nil , emojiMas.count>0{
            let randNum = Int(arc4random_uniform(UInt32(emojiMas.count)))
            emoDict[card.identifier] = emojiMas.remove(at: randNum)
        }
        return emoDict[card.identifier] ?? "?"
    }
    
    //MARK: Touch test
    private func flipCard(withEmoji emoji:String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor =  _ColorLiteralType(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

