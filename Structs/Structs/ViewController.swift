//
//  ViewController.swift
//  Structs
//
//  Created by paco williams on 10/9/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()

    fileprivate func setupLabels() {
        // Do any additional setup after loading the view.
        
        titleLabel.numberOfLines = 0
        subTitleLabel.numberOfLines = 0
        
        titleLabel.font = UIFont(name: "Futura", size: 33)
        
        //        titleLabel.backgroundColor = .red
        //        subTitleLabel.backgroundColor = .blue
        
        titleLabel.text = "Welcome To Structs"
        subTitleLabel.text = "Good morning and welcome to structs, this is the new way of learning how to program data structures"
        
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        
        stackView.spacing = 5
        
        //enable auto layout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //center stackview
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor,  constant: -70).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        
    }


}

