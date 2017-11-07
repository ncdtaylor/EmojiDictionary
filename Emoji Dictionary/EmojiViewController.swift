//
//  EmojiViewController.swift
//  Emoji Dictionary
//
//  Created by Nick Taylor on 07/11/2017.
//  Copyright © 2017 Taylor Made Solutions. All rights reserved.
//

import UIKit

class EmojiViewController: UIViewController {
    
    @IBOutlet weak var myEmoji: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    var emoji = ""
    var emojiDefinition = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myEmoji.text = emoji
        myLabel.text = emojiDefinition
    }
}
