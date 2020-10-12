//
//  Product.swift
//  Persistance
//
//  Created by paco williams on 10/5/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class Product: NSObject, Encodable, Decodable
{
    
    
    init(ID:Int, Description: String, Quantity: Int) {
        self.ID = ID;
        self.Description = Description
        self.Quantity = Quantity
    }
    
    public var ID: Int
    public var Description: String
    public var Quantity: Int

}
