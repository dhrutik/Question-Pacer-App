//
//  ResultsView.swift
//  qPacer
//
//  Created by Paul Tangen on 9/12/19.
//  Copyright © 2019 Dhruti Kuchibhotla. All rights reserved.
//

import Foundation
import UIKit
import Charts

class ResultsView: UIView, ChartViewDelegate {
    
    let titleLabel = UILabel()
    let barChartView = HorizontalBarChartView()
    var chartHeight = CGFloat()
    let barHeight:Int = 60
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.accessibilityLabel = "resultsViewInst"
        self.barChartView.delegate = self
        self.layoutForm()
        self.pageLayoutWithData()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func layoutForm(){
        
        self.backgroundColor = UIColor.white
        
        // welcome label
        self.addSubview(self.titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.text = "Results"
        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor = UIColor.black
        
        self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
        
        self.layoutIfNeeded()
    }
    
    func pageLayoutWithData() {
        self.chartHeight = CGFloat(500)
        
        self.addSubview(self.barChartView)
        self.barChartView.translatesAutoresizingMaskIntoConstraints = false
        self.barChartView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 24).isActive = true
        self.barChartView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.barChartView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.barChartView.heightAnchor.constraint(equalToConstant: self.chartHeight).isActive = true
        self.updateChartWithData()
    }
    
    func updateChartWithData() {
        //let stringFormatter = ChartStringFormatter()        // allow labels to be shown for bars
        //let percentFormatter = PercentValueFormatter()      // allow labels to be shown for bars
        var dataEntries: [BarChartDataEntry] = []
        
        // data and names of the bars
        let dataPoints: [Double] = [3.8,3.1, 1.0, 2.8, 0.6, 7.8, 4.1, 2.7, 5.6]   // values for the bars
        //stringFormatter.nameValues = self.store.equitiesForBuyNames      // labels for the y axis
        
        // formatting, the horizontal bar chart is rotated so the axis labels are odd
        //barChartView.xAxis.valueFormatter = stringFormatter // allow labels to be shown for bars
        barChartView.xAxis.drawGridLinesEnabled = false     // hide horizontal grid lines
        barChartView.xAxis.drawAxisLineEnabled = false      // hide right axis
        //barChartView.xAxis.labelFont = UIFont(name: Constants.appFont.regular.rawValue, size: Constants.fontSize.small.rawValue)!
        //barChartView.xAxis.setLabelCount(stringFormatter.nameValues.count, force: false)
        barChartView.xAxis.granularityEnabled = true
        barChartView.xAxis.granularity = 1.0
        //barChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        barChartView.rightAxis.enabled = false              // hide values on bottom axis
        barChartView.leftAxis.enabled = false               // hide values on top axis
        barChartView.animate(xAxisDuration: 0.0, yAxisDuration: 0.6)
        barChartView.legend.enabled = false
        if let chartDescription = barChartView.chartDescription {
            chartDescription.enabled = false
        }
        barChartView.drawValueAboveBarEnabled = false       // places values inside the bars
        
        barChartView.leftAxis.axisMinimum = 0.0             // required to show values on the horz bars, its a bug
        //if let maxBarValue = self.equitiesForBuyExpectedROI.max() {
            //barChartView.leftAxis.axisMaximum = maxBarValue + 2
        //}
        
        for (index, dataPoint) in dataPoints.enumerated() {
            let dataEntry = BarChartDataEntry(x: Double(index), y: dataPoint)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "")
        chartDataSet.colors = [UIColor.blue]
        //chartDataSet.valueFont = UIFont(name: Constants.appFont.regular.rawValue, size: Constants.fontSize.small.rawValue)!
        chartDataSet.valueTextColor = UIColor.white
        //chartDataSet.valueFormatter = percentFormatter      // formats the values into a %
        let chartData = BarChartData(dataSet: chartDataSet)
        
        self.barChartView.data = chartData
    }

}
