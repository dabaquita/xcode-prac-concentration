//
//  ViewController.swift
//  Concentration
//
//  Created by Denielle Kirk Abaquita on 2/25/18.
//  Copyright © 2018 Denielle Kirk Abaquita. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    // Instance variables
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    // lazy counts as this "var is initialized" -- cannot have a did set
    
    var flipCount = 0 {                   // same as flipCount: Int (hold option over flipCount)
        didSet{     // property observer; changes the label according to updates on variable
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    // UI Outlets
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!               // Array of UI buttons (Command Click to change stuff)
    
    // Creates a new game
    @IBAction func newGame(_ sender: UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Flips the cards
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {             // exclamation point assumes that the optional is SET so unwrap
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Chosen card not in cardButtons")
        }
    }
    
    // Makes sure all cards and card buttons are matched
    func updateViewFromModel()
    {
        for index in cardButtons.indices    // countable range for the entire array
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            // Changes the card image
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)    // make clear
                
            }
        }
    }
    
    var emojiChoices = ["👻", "🎃", "🔥", "😈", "😾", "🌚", "🍕", "🍎", "⛪️"]
    // var emoji = Dictionary<Int, String>() - same thing as below
    var emoji = [Int:String]()
    
    
    func emoji(for card: Card) -> String {
    
        // checks if emojiChoices array is empty and if emoji identifier is not set, go get set and grab an emoji
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
                let randomIndex = Int( arc4random_uniform( UInt32(emojiChoices.count) ) ) // generates number between 0 and number, exclusive
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)   // removes from emojiChoices and places emoji in the dictionary
            }
        
        /* Same code as below
         if emoji[card.identifier] != nil {  // optional
            return emoji[card.identifier]!
        } else {
            return "?"
        } */
        
        return emoji[card.identifier] ?? "?"
    }
}
    



