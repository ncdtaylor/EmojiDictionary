//
//  EmojiTableViewController.swift
//  Emoji Dictionary
//
//  Created by Nick Taylor on 07/11/2017.
//  Copyright © 2017 Taylor Made Solutions. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    let emojiRanges = [
        0x1F601...0x1F64F,
        0x2702...0x27B0,
        0x1F680...0x1F6C0,
        0x1F170...0x1F251
    ]
    var emojis:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for range in emojiRanges {
            for i in range {
                let c = String(UnicodeScalar(i)!)
                emojis.append(c)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = emojis[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.row]
        performSegue(withIdentifier: "ourSegue", sender: emoji)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let emojiDefVC = segue.destination as! EmojiViewController
        emojiDefVC.emoji = sender as! String
        var emojiDescription : String = ""
        let cfstr = NSMutableString(string: String(describing: sender)) as CFMutableString
        var range = CFRangeMake(0, CFStringGetLength(cfstr))
        CFStringTransform(cfstr, &range, kCFStringTransformToUnicodeName, false)
        //print(cfstr)
        let emojiDescriptionOriginal = cfstr as String
        emojiDescription = String(emojiDescriptionOriginal.dropFirst(12))
        emojiDescription = String(emojiDescription.dropLast(2))
        emojiDefVC.emojiDefinition = emojiDescription
    }
}
