//
//  ViewController.swift
//  qPacer
//
//  Created by Dhruti Kuchibhotla on 8/5/19.
//  Copyright © 2019 Dhruti Kuchibhotla. All rights reserved.
//

import UIKit

var arraySize = 0;
class ViewController: UIViewController {

    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var label: UILabel!
    //var chartsViewInst = ChartsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeText(_ sender: UIButton) {
        let text1 = field.text;
        label.text = text1;
    }

    
}

extension UIViewController{
    
}
