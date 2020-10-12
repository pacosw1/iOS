//
//  DetailViewController.swift
//  TableViews
//
//  Created by paco williams on 9/7/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PointsLabel: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var hobbyInput: UITextField!
    
    
    var player : Jugador!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageView.image = player.img
        NameLabel.text = player.nombre
        PointsLabel.text = String(player.puntos)
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
