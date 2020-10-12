//
//  ViewController.swift
//  segue
//
//  Created by paco williams on 9/3/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var MainView: UIView!
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var MessageField: UILabel!
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var Background: UIView!
    
    
    var message: String!
    var image: UIImage!
    var bgColor: UIColor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    //return saved message
    @IBAction func unwindEditar(segue: UIStoryboardSegue) {
        MessageField.text = message!
    }
    
    //set background color on unwind
    @IBAction func unwindBackgroundColor(segue: UIStoryboardSegue) {
              Background.backgroundColor = bgColor!
    }
    
    //return selected Image
    @IBAction func unwindImages(segue: UIStoryboardSegue) {
        let initial = segue.source as! ImageViewController
        Image.image = initial.Selected
    }

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch (segue.identifier) {
        case "editFields":
            let editFields = segue.destination as! EditViewController
            editFields.message = MessageField.text!

            break;
        case "expandImg":
            break
        default:
            print("error")
            break
        }
    }


}

