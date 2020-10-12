//
//  ViewControllerAdd.swift
//  TableViews
//
//  Created by paco williams on 9/25/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

protocol AddPlayerProtocol {
    func addPlayer(p: Jugador)
    
}

class ViewControllerAdd: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var NameInput: UITextField!
    @IBOutlet weak var ScoreInput: UITextField!
    @IBOutlet weak var ImageVIew: UIImageView!
    
    var delegado: AddPlayerProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func OnChangeImg(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func onSave(_ sender: Any) {
        let player = Jugador(nombre: NameInput.text!, puntos: Int(ScoreInput.text!)!, img: ImageVIew.image)
        
        delegado.addPlayer(p: player)
        navigationController?.popViewController(animated: true)
        
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        let foto = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        ImageVIew.image = foto
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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
