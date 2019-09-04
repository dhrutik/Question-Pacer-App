//
//  TimerViewController.swift
//  qPacer
//
//  Created by Dhruti Kuchibhotla on 8/5/19.
//  Copyright © 2019 Dhruti Kuchibhotla. All rights reserved.
//

import Foundation
import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var arrayLabel: UILabel!
    @IBOutlet weak var printTimesLabel: UILabel!
    var time = 0;
    var timer = Timer();
    var tapCounter = 0;
    

    var array = [IntegerLiteralType]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        arrayLabel.text = "0";
        array.append(0)
        
    }
    
    @IBAction func tapTimer(_ sender: UITapGestureRecognizer) {
        tapCounter+=1;
        if(tapCounter%2==1){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.action), userInfo: nil, repeats: true)
        }else if(tapCounter%2==0){
            timer.invalidate();
            array.append(time)
            time = 0;
            timerLabel.text = String(time);
            arrayLabel.text = String(array[array.count-1])
        }
        
    }
    @IBAction func startTimer(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.action), userInfo: nil, repeats: true)
    }
    
    @objc func action(){
        time += 1;
        timerLabel.text = String(time);
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        timer.invalidate();
        array.append(time)
        time = 0;
        timerLabel.text = String(time);
        arrayLabel.text = String(array[array.count-1])
    }
    
    @IBAction func pauseTimer(_ sender: UIButton) {
        timer.invalidate();
    }
    @IBAction func printTimes(_ sender: UIButton) {
        for time in array{
            let arr  = (self.printTimesLabel.text ?? "")+" "+String(time) //+"<space>"+ to +","+ if you need lap times are comma separated.
            self.printTimesLabel.text = arr
        }
    }
    
    
}

extension UIViewController{
    
}

