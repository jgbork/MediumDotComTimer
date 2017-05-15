//
//  ViewController.swift
//  MediumDotComTimer
//
//  Created by Jeffrey Bork on 5/10/17.
//  Copyright © 2017 Jeffrey Bork. All rights reserved.
//  https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f

import UIKit
var st = 10

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "\(st)"
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBOutlet weak var timerLabel: UILabel!
    
    
    var seconds = st
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    
    @IBAction func startButtonTapped(_ sender: Any) {
        if timer.isValid != true {
        runTimer()
        }
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
        } else {
            runTimer()
            self.resumeTapped = false
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        timer.invalidate()
        seconds = st
        timerLabel.text = "\(seconds)"
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        if seconds == 0 {
            timer.invalidate()
        } else {
            seconds -= 1
            timerLabel.text = "\(seconds)"
        }
    }
}

