//
//  ViewController.swift
//  Egg Timer
//
//  Created by Michele Galvagno on 12/11/2018.
//  Copyright © 2018 Michele Galvagno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Properties & Methods
    var timer = Timer()
    var remainingTime = 210
    
    func launchTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.processTimer), userInfo: nil, repeats: true)
    }
    
    @objc func processTimer() {
        remainingTime -= 1
        timerLabel.text = String(remainingTime)
        
        if remainingTime <= 0 {
            timer.invalidate()
        }
    }
    
    // Outlets & Actions
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func playButtonPressed(_ sender: UIBarButtonItem) {
        launchTimer()
    }
    
    @IBAction func pauseButtonPressed(_ sender: UIBarButtonItem) {
        timer.invalidate()
    }
   
    @IBAction func plusTenButtonPressed(_ sender: UIBarButtonItem) {
        remainingTime += 10
        timerLabel.text = String(remainingTime)
    }
    
    @IBAction func minusTenButtonPressed(_ sender: UIBarButtonItem) {
        if remainingTime > 10 {
            remainingTime -= 10
            timerLabel.text = String(remainingTime)
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIBarButtonItem) {
        remainingTime = 210
        timerLabel.text = String(remainingTime)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timerLabel.text = String(remainingTime)
    }
}

