//
//  ResultsViewControler.swift
//  qPacer
//
//  Created by Paul Tangen on 9/12/19.
//  Copyright © 2019 Dhruti Kuchibhotla. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewControler: UIViewController {
    
    var resultsViewInst = ResultsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    override func loadView(){
        // hide nav bar on login page
        //self.navigationController?.setNavigationBarHidden(true, animated: .init(true))
        self.resultsViewInst.frame = CGRect.zero
        self.view = self.resultsViewInst
    }

}
