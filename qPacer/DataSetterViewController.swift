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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        
        timeGivenLabel.text = "\(currentValue)"
    }
    
}

