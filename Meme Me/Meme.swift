//
//  Meme.swift
//  Meme Me
//
//  Created by Edwin Rodriguez on 3/25/15.
//  Copyright (c) 2015 Edwin Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class Meme {
    let topText: String
    let bottomText: String
    let originalImage: UIImage
    let memedImage: UIImage
    
    init(topText: String, bottomText: String, originalImage: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.originalImage = originalImage
        self.memedImage = memedImage
    }
}