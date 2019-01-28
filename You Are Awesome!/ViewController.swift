//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by joseph Parks on 1/13/19.
//  Copyright © 2019 Joseph Parks. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var awesomeImageView: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageIndex = -1
    var soundIndex = -1
    let numberOfImages = 10
    let numberOfSounds = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int{
        var newIndex: Int
        repeat {
            newIndex = Int.random(in: 0..<maxValue)
        } while lastNumber == newIndex
        return newIndex
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        var soundName = "sound\(soundIndex)"
        
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
            
        } else {
            print("ERROR: file \(soundName) didn't load")
        }
    }
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if soundSwitch.isOn == false && soundIndex != -1 {
                awesomePlayer.stop()
        }
    }
    
    @IBAction func showMessagePressed(_ sender: UIButton) {

        
        let messages = ["You Are Awesome!", "You Are Great!", "You Are Fantastic!", "When the Genius Bar needs help, they call you", "You Brighten My Day!", "You are da bomb!", "Hey, fabulous!", "You are tremendous!", "You've got the design skills of Jony Ive!"]
        
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
 
        
        imageIndex = nonRepeatingRandom(lastNumber: imageIndex, maxValue: numberOfImages)
        awesomeImageView.image = UIImage(named: "image\(imageIndex)")
        
        if soundSwitch.isOn {
            soundIndex = nonRepeatingRandom(lastNumber: soundIndex, maxValue: numberOfSounds)
            let soundName = "sound\(soundIndex)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
        

    }
    

}

