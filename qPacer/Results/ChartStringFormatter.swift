//
//  ChartStringFormatter.swift
//  Charts
//
//  Created by Paul Tangen on 9/16/19.
//

import Foundation
import Charts


class ChartStringFormatter: NSObject, IAxisValueFormatter {
    
    var nameValues = [String]()
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return String(describing: nameValues[Int(value)])
    }
}
