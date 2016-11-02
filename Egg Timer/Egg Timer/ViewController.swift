//
//  ViewController.swift
//  Egg Timer
//
//  Created by Atin Singhal on 02/11/16.
//  Copyright © 2016 Atin Singhal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var time = 210
    var count = 0
    
    func decreaseTimer() {
        if time > 2 {
            time -= 1
            timerLabel.text = String(time)
        }   else if time == 2   {
            time -= 1
            secondsLabel.text = "second left"
            timerLabel.text = String(time)
        }   else if time == 1   {
            time -= 1
            secondsLabel.text = "seconds left"
            timerLabel.text = String(time)
        }   else    {
            timer.invalidate()
            count = 0
            secondsLabel.text = " "
            timerLabel.text = "TIME UP"
            secondsLabel.text = "Time to Reset"
        }
    }
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var secondsLabel: UILabel!
    
    @IBAction func play(_ sender: Any) {
        if count == 0  {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
            count += 1
        }   else    {
            
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
        count = 0
    }
    
    @IBAction func reset(_ sender: Any) {
        time = 210
        timerLabel.text = String(time)
        secondsLabel.text = "seconds left"
        count = 0
    }
    
    @IBAction func plusTen(_ sender: Any) {
        time += 10
        timerLabel.text = String(time)
        secondsLabel.text = "seconds left"
    }
    
    @IBAction func minusTen(_ sender: Any) {
        if time > 10    {
            time -= 10
            timerLabel.text = String(time)
            if time > 1 {
                secondsLabel.text = "seconds left"
            }   else    {
                secondsLabel.text = "second left"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timerLabel.text = String(time)
        if time > 1 {
            secondsLabel.text = "seconds left"
        }   else if time == 1   {
            secondsLabel.text = "second left"
        }   else    {
            time = 210
            timerLabel.text = String(time)
            secondsLabel.text = "seconds left"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

