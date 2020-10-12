//
//  ImageViewController.swift
//  segue
//
//  Created by paco williams on 9/3/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var ImgOne: UIButton!
    @IBOutlet weak var ImgTwo: UIButton!
    @IBOutlet weak var ImgThree: UIButton!
    
    @IBAction func OnImgOne(_ sender: Any) {
        Selected = ImgOne.currentImage!
    }
    
    
    @IBAction func OnImgTwo(_ sender: Any) {
        Selected = ImgTwo.currentImage!
    }
    
    
    @IBAction func OnImgThree(_ sender: Any) {
        Selected = ImgThree.currentImage!
    }
    
    
    var Selected: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       
        
        //loaded passed img from previous view
//        ExpandedImg.image = img!
        // Do any additional setup after loading the view.
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
