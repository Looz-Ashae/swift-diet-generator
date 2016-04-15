//
//  Food.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 8/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import RealmSwift

class Food : Object, XMLSerializable {
    dynamic var name: String = ""
    dynamic var caloriesPerServing: Double = 0.0
    dynamic var servingInGrams: Double = 0.0
    dynamic var proteinsPerServing: Double = 0.0
    dynamic var fatsPerServing: Double = 0.0
    dynamic var carbohydratesPerServing: Double = 0.0
    dynamic var quantity: Double = 0.0

    convenience required init(name: String, caloriesPerServing: Double, servingInGrams: Double, proteinsPerServing: Double, fatsPerServing: Double, carbohydratesPerServing: Double, quantity: Double) {
        self.init()
        self.name = name
        self.caloriesPerServing = caloriesPerServing
        self.servingInGrams = servingInGrams
        self.proteinsPerServing = proteinsPerServing
        self.fatsPerServing = fatsPerServing
        self.carbohydratesPerServing = carbohydratesPerServing
        self.quantity = quantity
    }
    
    func toXML()-> String {
        return "<name>\(name)</name>\n<caloriesPerServing>\(caloriesPerServing)</caloriesPerServing>\n<servingInGrams>\(servingInGrams)</servingInGrams>\n<proteinsPerServing>\(proteinsPerServing)</proteinsPerServing>\n<fatsPerServing>\(fatsPerServing)</fatsPerServing>\n<carbohydratesPerServing>\(carbohydratesPerServing)</carbohydratesPerServing>\n<quantity>\(quantity)</quantity>"
    }
    
}
    