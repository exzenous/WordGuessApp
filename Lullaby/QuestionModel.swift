//
//  QuestionModel.swift
//  Lullaby
//
//  Created by Nathachai Bangkung on 11/6/2562 BE.
//  Copyright © 2562 BE Nathachai Bangkung. All rights reserved.
//

import Foundation
import UIKit

class QuestionModel {
    
    var word: String?
    var image: UIImage?
    var hint: String?
    
    init(word:String) {
        self.word = word
        self.image = #imageLiteral(resourceName: "Unavailable")
        self.hint = "No Hints for You"
    }
    
    init(word:String,image:UIImage) {
        self.word = word
        self.image = image
        self.hint = "No Hints for You"
    }
    
    init(word: String,image: UIImage,hint: String) {
        self.word = word
        self.image = image
        self.hint = hint
    }
}
