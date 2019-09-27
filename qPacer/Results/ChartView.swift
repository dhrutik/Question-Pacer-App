//
//  ChartView.swift
//  qPacer
//
//  Created by Paul Tangen on 9/24/19.
//  Copyright © 2019 Dhruti Kuchibhotla. All rights reserved.
//

import Foundation
import UIKit
import Charts

class ChartView: UIScrollView, ChartViewDelegate  {

    @IBOutlet weak var contentView: UIView!
    let barChartView = HorizontalBarChartView()
    var chartHeight = CGFloat()
    let barHeight:Int = 60
    var dataPoints: [Double] = [3.8, 3.1, 1.0, 2.8, 4.6, 7.8, 4.1, 2.7, 5.6, 2.3, 6.1, 2.9, 3.7]   // values for the bars
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.barChartView.delegate = self
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    func setup(){
        Bundle.main.loadNibNamed("ChartView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
        
        self.chartHeight = CGFloat(self.dataPoints.count * self.barHeight)
        
        self.addSubview(self.barChartView)
        self.barChartView.translatesAutoresizingMaskIntoConstraints = false
        self.barChartView.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
        self.barChartView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.barChartView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.barChartView.heightAnchor.constraint(equalToConstant: self.chartHeight).isActive = true
        self.contentSize = CGSize(width: self.frame.width, height: self.chartHeight * 1.1)
        self.updateChartWithData()
    }
    
    func updateChartWithData() {
        let stringFormatter = ChartStringFormatter()       // allow labels to be shown for bars
        
        var dataEntries: [BarChartDataEntry] = []
        
        // data and names of the bars
        stringFormatter.nameValues = ["Q1", "Q2", "Q3", "Q4", "Q5", "Q6", "Q7", "Q8", "Q9", "Q10", "Q11", "Q12", "Q13"]//self.store.questionLabels      // labels for the y axis
        
        self.dataPoints.reverse()
        stringFormatter.nameValues.reverse()
        
        // formatting, the horizontal bar chart is rotated so the axis labels are odd
        barChartView.xAxis.valueFormatter = stringFormatter // allow labels to be shown for bars
        barChartView.xAxis.drawGridLinesEnabled = false     // hide horizontal grid lines
        barChartView.xAxis.drawAxisLineEnabled = false      // hide right axis
        barChartView.xAxis.labelFont = UIFont(name: "HelveticaNeue", size: 12)!
        barChartView.xAxis.setLabelCount(stringFormatter.nameValues.count, force: false)
        barChartView.xAxis.granularityEnabled = true
        barChartView.xAxis.granularity = 1.0
        barChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        barChartView.rightAxis.enabled = false              // hide values on bottom axis
        barChartView.leftAxis.enabled = false               // hide values on top axis
        barChartView.animate(xAxisDuration: 0.0, yAxisDuration: 0.6)
        barChartView.legend.enabled = false
        if let chartDescription = barChartView.chartDescription {
            chartDescription.enabled = false
        }
        barChartView.drawValueAboveBarEnabled = false       // places values inside the bars
        barChartView.leftAxis.axisMinimum = 0.0             // required to show values on the horz bars, its a bug
        
        for (index, dataPoint) in dataPoints.enumerated() {
            let dataEntry = BarChartDataEntry(x: Double(index), y: dataPoint)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "")
        chartDataSet.colors = [UIColor(red: 0x09/255, green: 0xcc/255, blue: 0xaf/255, alpha: 1.0)]
        chartDataSet.valueFont = UIFont(name: "HelveticaNeue", size: 12)!
        chartDataSet.valueTextColor = UIColor.white
        let chartData = BarChartData(dataSet: chartDataSet)
        
        self.barChartView.data = chartData
    }
}
