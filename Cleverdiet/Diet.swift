//
//  Swift.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 8/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit

struct Diet : XMLSerializable {
    var name: String?
    var foods : [Food]
    
    init() {
        self.foods = [Food]()
    }
    
    init(name: String, foods : [Food]) {
        self.name = name
        self.foods = foods
    }
    
    func toXML()-> String {
        var xml = "<name>\(name)</name>\n"
        for food in foods {
            xml.appendContentsOf("\n<food>\n\(food.toXML())</food>")
        }
        return xml
    }
}
