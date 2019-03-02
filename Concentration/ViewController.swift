//
//  ViewController.swift
//  Concentration
//
//  Created by Oliver on 22.02.19.
//  Copyright © 2019 OliCorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numbersOfPairsOfCards: (cardButtons.count + 1) / 2)
//    lazy var emojiChoices = emojisForTheme(number: 0)
    var emoji = [Int: String]()
    let emojiThemes: [[String]] = [
        ["👻", "🎃", "😱", "💀", "☠️", "🦇", "🕷", "🕸", "😈", "👺"],
        ["😅", "😃", "🤣", "😂", "😇", "😊", "😍", "😋", "😛", "😎"],
        ["🐶", "🐱", "🐭", "🐹", "🐼", "🐻", "🦊", "🐰", "🐨", "🐯"],
        ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈"],
        ["🥭", "🍒", "🍑", "🥦", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑"],
        ["🏀", "⚽️", "🏈", "⚾️", "🥎", "🏉", "🎱", "🏓", "🏑", "🏹"]]
    lazy var currentTheme = Int.random(in: 0..<emojiThemes.count)
    lazy var emojiChoices = emojiThemes[currentTheme]
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var scoreCountLabel: UILabel!
    @IBOutlet var  cardButtons: Array<UIButton>!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("Choosen button not in cardButtons!")
        }
    }
    
    @IBAction func touchRestart(_ sender: UIButton) {
        game = Concentration(numbersOfPairsOfCards: (cardButtons.count + 1) / 2)
        updateViewFromModel()
        currentTheme = Int.random(in: 0..<emojiThemes.count)
        emojiChoices = emojiThemes[currentTheme]
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        flipCountLabel.text = "Flips: \(game.flipCount)"
        scoreCountLabel.text = "Score: \(game.score)"
    }
    
    func emoji( for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    func emojisForTheme(themeNumber theme: Int) -> [String]{
        
        return emojiThemes[theme]
    }
    

}

