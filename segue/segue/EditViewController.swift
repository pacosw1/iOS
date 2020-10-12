//
//  EditViewController.swift
//  segue
//
//  Created by paco williams on 9/3/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var MessageInput: UITextField!
    
    var message: String!
    var valid: Bool = false
    
    @IBAction func SaveBtn(_ sender: Any) {
        
         if MessageInput.text == "" {
            
             let alert = UIAlertController(title: "Error", message: "Campo Vacio", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "Button", style: .default, handler: nil))
             self.present(alert, animated: true, completion: nil)
            return
        }
        //else return invalid
        valid = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
        
        MessageInput.text = message!

    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return valid
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
     
         
        let initView = segue.destination as! ViewController
        //send message back on save
        initView.message = MessageInput.text!
    }
    

}
