//
//  EngWordGuessView.swift
//  Lullaby
//
//  Created by Nathachai Bangkung on 11/6/2562 BE.
//  Copyright © 2562 BE Nathachai Bangkung. All rights reserved.
//

import UIKit

class EngWordGuessView: UIViewController {
    
    let lostAlert = UIAlertController(title: "You've Lost", message: "Better Try Next Time...", preferredStyle: .actionSheet)
    let winAlert = UIAlertController(title: "You've Win!", message: "Thanks for Playing", preferredStyle: .alert)
    
    var lifePointCount: Int = 5
    var receivedVocab: QuestionModel?
    
    @IBOutlet weak var lifePoint: UILabel!
    @IBOutlet weak var vocabGuess: UILabel!
    @IBOutlet weak var vocabImage: UIImageView!
    @IBOutlet weak var vocabHint: UILabel!
    @IBOutlet weak var userGuessField: UITextField!
    
    
    @IBAction func tappedAnswer(_ sender: Any) {
        
        if (userGuessField.text! != receivedVocab!.word!) {
            
            if (lifePointCount > 0 ) {
                
                if ((lifePointCount - 1) == 0) {
                    lifePointCount -= 1
                    lifePoint.text = "💔"
                    self.present(lostAlert,animated: true)
                    
                }else {
                    lifePointCount -= 1
                    lifePoint.text = String(repeating: "❤️", count: lifePointCount)
                }
                
            }
            
        }
        else{
            self.present(winAlert,animated: true)
        }
        
        print(lifePointCount)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lifePoint.text = String(repeating: "❤️", count: lifePointCount)
        vocabImage.image = receivedVocab!.image!
        vocabGuess.text = String(repeating: "-", count: (receivedVocab!.word)!.count)
        vocabHint.text = "Hint: \(receivedVocab!.hint!)"
        
        lostAlert.addAction(UIAlertAction(title: "Gotcha!", style: .default, handler: { (action) in
            StartViewController.userScore -= 1
            self.dismiss(animated: true, completion: nil)
        }))
        winAlert.addAction(UIAlertAction(title: "Bye", style: .default, handler: { (action) in
            StartViewController.userScore += 1
            self.dismiss(animated: true, completion: nil)
        }))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
