//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft": 10, "Medium": 420, "Hard": 720]
    var player: AVAudioPlayer?
    var timer = Timer()
    var totalTime: Int = 0
    var secondsPass: Int = 0
    

 
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var ChangeLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!

        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPass = 0
        ChangeLabel?.text = hardness

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }



    @objc func updateCounter() {
        //example functionality
        if secondsPass < totalTime {
          let percentage = Float(secondsPass)/Float(totalTime)
            print(percentage)
            secondsPass += 1
            progressBar.progress = Float(percentage)
        
        }else{
            timer.invalidate()
            ChangeLabel.text = "done!"
            playSound()
        }
   
                        
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension:"mp3")
       
        player = try! AVAudioPlayer(contentsOf: url! )
        player.play()

    }
    


}
