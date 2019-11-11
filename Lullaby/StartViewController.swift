//
//  ViewController.swift
//  Lullaby
//
//  Created by Nathachai Bangkung on 11/6/2562 BE.
//  Copyright © 2562 BE Nathachai Bangkung. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
   
    @IBOutlet weak var userScoreLabel: UILabel!
    
    static var userScore: Int = 0
    var vocabularies: [QuestionModel] = [QuestionModel(word: "Tree"),QuestionModel(word: "Tanjiro", image: #imageLiteral(resourceName: "Tanjiro"), hint: "You favourite food or drink or maybe your favourite singer")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userScoreLabel.text = "Your Score : \(StartViewController.userScore)"
    }
    
    @IBAction func tappedStartGame(_ sender: Any) {
        performSegue(withIdentifier: "toFirstGame", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as! EngWordGuessView
        nextView.modalPresentationStyle = .fullScreen
        nextView.receivedVocab = vocabularies[1]
    }

}

