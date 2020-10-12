//
//  DetailViewController.swift
//  TableVIewController
//
//  Created by paco williams on 9/14/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    
    
    var Image: UIImage!
    var Name: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        ImageView.image = Image!
        NameLabel.text = Name
      
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
