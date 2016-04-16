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
    dynamic var username: String?
    var foods : List<Food> = List()
    
    override var description: String {
        get {
            var dietDescription = ""
            for food in Array(foods) {
                dietDescription.appendContentsOf("\n\(food.description)")
            }
            return dietDescription
        }
    }
    
    convenience init(name: String, foods : List<Food>, forUserWithName: String) {
        self.init()
        self.name = name
        self.username = forUserWithName
        self.foods = foods
    }

}
