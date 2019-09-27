//
//  ViewController.swift
//  qPacer
//
//  Created by Dhruti Kuchibhotla on 8/5/19.
//  Copyright © 2019 Dhruti Kuchibhotla. All rights reserved.
//

import UIKit

var arraySize = 0;
class ResultsViewController: UIViewController {

    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var label: UILabel!
    var numberOfQs = Int()
    var numberOfMins = Int()
    var questionTimes = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("numberOfQs:", numberOfQs)
        print("numberOfMins:", numberOfMins)
        print("questionTimes:", questionTimes.count)
    }
    
    @IBAction func changeText(_ sender: UIButton) {
        let text1 = field.text;
        label.text = text1;
    }

    
}

extension UIViewController{
    
}
