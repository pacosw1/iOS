//
//  BackgroundViewController.swift
//  segue
//
//  Created by paco williams on 9/4/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class BackgroundViewController: UIViewController {

    
    @IBOutlet weak var LeftTop: UIButton!
    @IBOutlet weak var RightTop: UIButton!
    @IBOutlet weak var LeftBot: UIButton!
    @IBOutlet weak var RightBot: UIButton!
    
    var Selected: UIColor?
    var max: CGFloat = 255.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LeftTop.backgroundColor = UIColor(red: 250 / max, green: 100 / max, blue: 10.24 / max, alpha: 0.23)
        RightTop.backgroundColor = UIColor(red: 100 / max, green: 10 / max, blue: 10.24 / max, alpha: 0.23)
        LeftBot.backgroundColor = UIColor(red: 1 / max, green: 1 / max, blue: 255 / max, alpha: 0.23)
        RightBot.backgroundColor = UIColor(red: 0 / max, green: 255 / max, blue: 5 / max, alpha: 0.23)

        // Do any additional setup after loading the view.
    }
    
    //buttons that select a color
    @IBAction func onLeftTop(_ sender: Any) {
        Selected = LeftTop.backgroundColor
    }
    
    @IBAction func onRightTop(_ sender: Any) {
        Selected = RightTop.backgroundColor
    }
    
    @IBAction func onLeftBot(_ sender: Any) {
        Selected = LeftBot.backgroundColor
    }
    
    @IBAction func onRightBot(_ sender: Any) {
        Selected = RightBot.backgroundColor
    }
    
    
    //send color to main view before unwinding segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let initView = segue.destination as! ViewController
        
        initView.bgColor = Selected

    }
    

}
