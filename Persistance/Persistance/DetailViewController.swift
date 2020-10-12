//
//  DetailViewController.swift
//  Persistance
//
//  Created by paco williams on 10/5/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var IDLabel: UITextField!
    @IBOutlet weak var DescLabel: UITextField!
    @IBOutlet weak var SaveButton: UIButton!
    @IBOutlet weak var QtyLabel: UITextField!
    
    
    var ID: Int = 0
    var EditMode: Bool = false
    var Description: String = ""
    var Quantity: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = String(ID)

        IDLabel.text! = String(ID)
        DescLabel.text! = Description
        QtyLabel.text! = String(Quantity)
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func SaveData(_ sender: Any) {
        
        ID = Int(IDLabel.text!) ?? 0
        Description = DescLabel.text!
        Quantity = Int(QtyLabel.text!) ?? 0
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
