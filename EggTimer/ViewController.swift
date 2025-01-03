//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 10, "Medium": 420, "Hard": 720]

    var timer = Timer()
    var totalTime: Int = 0
    var secondsPass: Int = 0
    

 
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var ChangeLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!

        totalTime = eggTimes[hardness]!

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }



    @objc func updateCounter() {
        //example functionality
        if secondsPass < totalTime {
          let percentage = Double(secondsPass)/Double(totalTime)
            print(percentage)
            secondsPass += 1
            progressBar.progress = Float(percentage)
        
        }else{
            timer.invalidate()
            ChangeLabel.text = "done"
        }
    }
    


}
