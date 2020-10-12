//
//  iPhones.swift
//  TablesVIews
//
//  Created by paco williams on 9/28/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class iPhone: NSObject {

    var tipo: String
    var capacidad: String
    var precio: Float
    var foto: UIImage!
    
    init(tipo: String, capacidad: String, precio: Float, foto: UIImage!) {
        self.tipo = tipo;
        self.capacidad = capacidad
        self.precio = precio;
        self.foto = foto
    }
}
