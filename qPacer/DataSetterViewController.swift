//
//  dataSetterViewController.swift
//  qPacer
//
//  Created by Dhruti Kuchibhotla on 9/17/19.
//  Copyright © 2019 Dhruti Kuchibhotla. All rights reserved.
//

import Foundation
import UIKit

class DataSetterViewController: UIViewController {
    
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var timeGivenLabel: UILabel!
    @IBOutlet weak var questionsGiven: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        
        timeGivenLabel.text = "\(currentValue)"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is TimerViewController
        {
            let vc = segue.destination as? TimerViewController
            vc?.numberOfQs1 = Int(questionsGiven.text!) ?? 0
            vc?.numberOfMins1 = Int(timeSlider.value)
            
        }
    }
    
}

