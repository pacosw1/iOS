//
//  Jugador.swift
//  TableViews
//
//  Created by paco williams on 9/7/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class Jugador: NSObject {
    
    var nombre: String
    var puntos: Int
    var img: UIImage!
    
    init(nombre: String, puntos:Int, img: UIImage!) {
        self.nombre = nombre
        self.puntos = puntos
        self.img = img
    }

}
