//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Ryan Morrissey on 1/21/18.
//  Copyright © 2018 Morrissey. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var awesomeImage: UIImageView!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    let numberOfImages = 9
    let numberOfSounds = 6
    var soundName = ""
    
    // FIXME: - Please repair this error!
    // TODO: - Update viewDidLoad
    // Code below executes when the app's view first loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - My Own Functions
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }
            catch {
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
            
        }
        else {
            print("ERROR: file \(soundName) didn't load")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex  = Int(arc4random_uniform(UInt32(maxValue)))
        } while lastNumber == newIndex
        return newIndex
    }
    
    // MARK: - Actions
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !soundSwitch.isOn && soundNumber != -1 {
            // stop playing
            awesomePlayer.stop()
            }
        
        
    }
    @IBAction func showMessagePressed(_ sender: UIButton) {
        
        let messages = ["You Are Fantastic!", "You Are Great!", "You Are Amazing!", "When the Genius Bar needs help, they call you!", "You Brighten My Day!", "You Are Da Bomb!", "I can't wait to use your app!", "Fabulous? That's Sazan!"]
        
        //Show a message
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        //Show an image
        awesomeImage.isHidden = false
        imageNumber = nonRepeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
        
        if soundSwitch.isOn {
            // Get a random number to use in our soundName file
            soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
            //Play a sound
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
    }
        
       
    
}
        
        
/*
 //Show a message
 
 repeat {
 newIndex = Int(arc4random_uniform(UInt32(messages.count)))
 } while index == newIndex
 
 index = newIndex
 messageLabel.text = messages[index]
 
 //Show an image
 awesomeImage.isHidden = false
 repeat{
 newIndex = Int(arc4random_uniform(UInt32(numberOfImages)))
 }   while imageNumber == newIndex
 
 imageNumber = newIndex
 awesomeImage.image = UIImage(named: "image\(imageNumber)")
 
 
 //Get a random numver to use in our soundName file
 repeat{
 newIndex = Int(arc4random_uniform(UInt32(numberOfSounds)))
 }   while soundNumber == newIndex
 
 soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
 */

//Play a sound
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
   //     var randomIndex = Int(arc4random_uniform(UInt32(messages.count)))
   //     messageLabel.text = messages[randomIndex]
        
        /*
        messageLabel.text = messages[index]
        index = index + 1
        
        if index == messages.count {
            index = 0
        }
        */
/*
        let message1 = "You Are Fantastic!!!"
        let message2 = "You Are Great!"
        let message3 = "You Are Amazing!"
        
        if messageLabel.text == message1 {
            messageLabel.text = message2 }
        else if messageLabel.text == message2 {
            messageLabel.text = message3
        } else {
            messageLabel.text = message1
        }   */

    
    
   
    


