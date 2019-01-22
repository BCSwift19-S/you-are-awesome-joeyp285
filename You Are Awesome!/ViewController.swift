//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by joseph Parks on 1/13/19.
//  Copyright © 2019 Joseph Parks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    
    var index = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showMessagePressed(_ sender: UIButton) {

        
        let messages = ["You Are Awesome!", "You Are Great!", "You Are Fantastic!", "When the Genius Bar needs help, they call you", "You Brighten My Day!", "You are da bomb!", "Hey, fabulous!", "You are tremendous!", "You've got the design skills of Jony Ive!"]
        
        messageLabel.text = messages[index]
        if index == messages.count - 1 {
            index = 0
        } else {
            index = index + 1
        }
        
//        let message1 = "You Are Fantastic!!!"
//        let message2 = "You Are Great!"
//        let message3 = "You Are Amazing!"
//
//        if messageLabel.text == message1 {
//            messageLabel.text = message2
//        } else if messageLabel.text == message2 {
//            messageLabel.text = message3
//        } else {
//            messageLabel.text = message1
//        }
    }
    
}

