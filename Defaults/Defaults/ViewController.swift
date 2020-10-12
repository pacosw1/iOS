//
//  ViewController.swift
//  Defaults
//
//  Created by paco williams on 10/8/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var SoundSwitch: UISwitch!
    @IBOutlet weak var BackgroundTab: UISegmentedControl!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Volume: UISlider!
    
    let defaults = UserDefaults.standard;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Username.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: .editingChanged)

        
        SoundSwitch.isOn = defaults.bool(forKey: "sound")
        BackgroundTab.selectedSegmentIndex = defaults.integer(forKey: "bg")
        setBackgroundColor(id: defaults.integer(forKey: "bg"))
        Volume.value = defaults.float(forKey: "volume")
        Username.text = defaults.string(forKey: "username")
        // Do any additional setup after loading the view.
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        defaults.setValue(textField.text, forKey: "username")
    }

 
   
    
    @IBAction func OnSound(_ sender: Any) {
        defaults.setValue(SoundSwitch.isOn, forKey: "sound")
    }
    
    @IBAction func onSlideVolume(_ sender: Any) {
        defaults.setValue(Volume.value, forKey: "volume")
    }
    
    @IBAction func OnBackgroundChange(_ sender: Any) {
        
        let index = BackgroundTab.selectedSegmentIndex;
        defaults.setValue(index, forKey: "bg")
        setBackgroundColor(id: index)
    }
    
    
    func setBackgroundColor(id: Int) {
        
        var color: UIColor;
        
        switch (id) {
        case 0:
            color = UIColor.green
            break;
        case 1:
            color = UIColor.yellow
            break
        case 2:
            color = UIColor.blue
        default:
            color = UIColor.white
        }
        view.backgroundColor = color;
    }
    
}

