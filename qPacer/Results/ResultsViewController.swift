//
//  ResultsViewController.swift
//  qPacer
//
//  Created by Paul Tangen on 9/12/19.
//  Copyright © 2019 Dhruti Kuchibhotla. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    
    var resultsViewInst = ResultsView()
    var numberOfQs = 0;
    var average = 10;
    var numberOfMins = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        self.resultsViewInst.frame = CGRect.zero
        self.view = self.resultsViewInst
        print(numberOfQs)
        print(numberOfMins)
        
    }
    /*override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.resultsViewInst.frame = CGRect.zero
        self.view = self.resultsViewInst
    }*/
    
    /*override func loadView(){
        // hide nav bar on login page
        //self.navigationController?.setNavigationBarHidden(true, animated: .init(true))
        self.resultsViewInst.frame = CGRect.zero
        self.view = self.resultsViewInst
    }*/

}
