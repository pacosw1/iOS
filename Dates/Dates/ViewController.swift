//
//  ViewController.swift
//  Dates
//
//  Created by paco williams on 9/13/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var YearLabel: UILabel!
    @IBOutlet weak var DayNumericLabel: UILabel!
    @IBOutlet weak var WeekDayLabel: UILabel!
    @IBOutlet weak var MonthLabel: UILabel!
    
    let secondsInDay: Double = 60 * 60 * 24
    
    var date: Date!
    
    var yearFormatter = DateFormatter()
    var monthFormatter = DateFormatter()
    var dayFormatter = DateFormatter()
    var weekDayFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        date = Date()
        
        yearFormatter.dateFormat = "YYYY"
        dayFormatter.dateFormat = "dd"
        monthFormatter.dateFormat = "LLLL"
        weekDayFormatter.dateFormat = "EEEE"
        
        
        updateDate()
        
        override func shouldPerformSegue(withIdentifier: String, sender: Any?) -> Bool {
            
        }
        
        
        
    }
    
    
    func updateDate() -> Void {
        //update date labels
        YearLabel.text = yearFormatter.string(from: date)
        DayNumericLabel.text = dayFormatter.string(from: date)
        WeekDayLabel.text = weekDayFormatter.string(from: date)
        MonthLabel.text = monthFormatter.string(from: date)
        
    }

    @IBAction func OnSwipeLeft(_ sender: Any) {
        date = date.addingTimeInterval(secondsInDay)
        updateDate()
    }
    
    @IBAction func OnSwipeRight(_ sender: Any) {
        date = date.addingTimeInterval(-secondsInDay)
        updateDate()

    }
}

