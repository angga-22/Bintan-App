//
//  CovidVC.swift
//  Binary-App
//
//  Created by Fauzi Achmad B D on 23/06/21.
//

import UIKit
import Charts
import TinyConstraints
import Alamofire
import SwiftyJSON

class CovidVC: UIViewController {

    let currentDate = Date()
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalCases: UILabel!
    @IBOutlet weak var recoveredCases: UILabel!
    
    @IBOutlet weak var informationContainerLeft: UIView!
    @IBOutlet weak var informationContainerCenter: UIView!
    @IBOutlet weak var informationContainerRight: UIView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    // Instance line chart
//    lazy var lineChartView: LineChartView = {
//        let chartView = LineChartView()
//
//        // Setup The axis
//        chartView.rightAxis.enabled = false
//
//        let yAxis = chartView.leftAxis
//        yAxis.labelFont = .boldSystemFont(ofSize: 12)
//
//        chartView.xAxis.labelPosition = .bottom
//        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
//        chartView.xAxis.drawGridLinesEnabled = false
//
//        chartView.animate(xAxisDuration: 3.5)
//
//        return chartView
//
//    }()
    
    // Instance array
    
    var chartData = [ChartDataEntry]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // MARK: Date Label Update
        
        dateLabel.text = currentDate.formatString
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
        // MARK: Changing The Information Container Attributes
        changeAttribute([informationContainerLeft,informationContainerCenter,informationContainerRight])
        
        // MARK: Add the ChartView to the ViewController
        
        fetchCovid()
        
        
        
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(350)
        lineChartView.height(300)
//        lineChartView.noDataText = "Data is loading"
        
        // Setup The axis
        lineChartView.rightAxis.enabled = false
        
        let yAxis = lineChartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        lineChartView.xAxis.drawGridLinesEnabled = false
        
        lineChartView.animate(xAxisDuration: 3.5)
        
        
    }
    

    func changeAttribute(_ views: [UIView]) {
        
        for view in views {
            view.layer.applySketchShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 1), alpha: 0.2, x: 1, y: 2, blur: 12, spread: -3)
            view.backgroundColor = .white
            view.layer.cornerRadius = 20
        }
        
    }
    
    
    // MARK: Create Chart
    
    func setData(data:[ChartDataEntry]){
        
        let set1 = LineChartDataSet(entries: data, label: "Positive Cases")
        
        set1.mode = .cubicBezier
        set1.drawCirclesEnabled = false
        set1.lineWidth = 1.5
        set1.setColor(UIColor(named: "PrimaryColor")!)
        set1.fill = Fill(color: UIColor(named: "PrimaryColor")!)
        set1.fillAlpha = 0.8
        set1.drawFilledEnabled = true
        
        set1.drawHorizontalHighlightIndicatorEnabled = false
        set1.highlightColor = UIColor(named: "SecondaryColor")!
        
        let data = LineChartData(dataSet: set1)
        data.setDrawValues(false)
        lineChartView.data = data
        
        
    }
    
    // MARK: Fetch Data
    
    func fetchCovid(){
        
        let apiURL = "https://corona.kepriprov.go.id/data/chartData"
        
        AF.request(apiURL, method: .get, parameters: nil).responseJSON { [self] (response) in
        
            switch response.result {
            
            case .success(let value):
                
                let covidJSON: JSON = JSON(value)
                
                var count: Double = 14
                var iteration: Int = 3
                
                while count > 0 {
                    
                    //print(covidJSON[covidJSON.count-iteration]["tanggal"])
                    
                    let data = covidJSON[covidJSON.count-iteration]["jumlah_kasus_konfirmasi"].stringValue
                    
                    let totalKasus: Double = Double(data) ?? 0
                    
                    self.chartData.insert(ChartDataEntry(x: count, y: totalKasus),at: 0)
                    
                    DispatchQueue.main.async {
                        self.setData(data: self.chartData)
                    }
                    
                    count -= 1
                    iteration += 7

                }
                spinner.stopAnimating()
                totalCases.text = covidJSON[covidJSON.count-1]["jumlah_kasus_konfirmasi"].stringValue
                recoveredCases.text = covidJSON[covidJSON.count-1]["jumlah_kasus_konfirmasi_sembuh"].stringValue
                
            case .failure(_):
                print("Request Failed")
            }
            
        }
        
    }
    
}




extension CovidVC: ChartViewDelegate {
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
}
