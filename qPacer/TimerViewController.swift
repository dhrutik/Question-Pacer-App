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
    var graphTimes = "";
    
    
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
            //timer.invalidate();
            reset();
        }
        timerLabel.text = String(time);
        arrayLabel.text = "Q number:" + String(tapCounter);
    }
    /*@IBAction func startTimer(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.action), userInfo: nil, repeats: true)
    }*/
    @objc func action(){
        time += 1;
        timerLabel.text = String(time);
    }
    func reset (){
        array.append(time)
        time = 0;
        timerLabel.text = String(time);
        arrayLabel.text = String(array[array.count-1])
    }
    func printTime() -> String{
        for time in array{
            let arr  = (graphTimes)+" "+String(time) //+"<space>"+ to +","+ if you need lap times are comma separated.
            graphTimes = arr
        }
        return graphTimes;
    }
    //var graphTimesShown = printTime();
    
    @IBAction func resetTimer(_ sender: UIButton) {
        timer.invalidate();
        //reset();
    }
    
    @IBAction func pauseTimer(_ sender: UIButton) {
        timer.invalidate();
        timerLabel.text = "0";
    }
    @IBAction func printTimes(_ sender: UIButton) {
        self.printTimesLabel.text = printTime();
    }
    //lazy var text = printTimesLabel.text;
    
    
    
}

extension UIViewController{
    
}

