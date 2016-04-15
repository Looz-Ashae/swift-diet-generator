//
//  Swift.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 8/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import RealmSwift

class Diet : Object {
    dynamic var name: String?
    var foods : List<Food> = List()
    
    convenience init(name: String, foods : List<Food>) {
        self.init()
        self.name = name
        self.foods = foods
    }

}
