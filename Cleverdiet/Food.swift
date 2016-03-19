//
//  Food.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 8/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit

struct Food : XMLSerializable {
    let name: String
    let caloriesPerServing: Double
    let servingInGrams: Double
    let proteinsPerServing: Double
    let fatsPerServing: Double
    let carbohydratesPerServing: Double
    let quantity: Double

    init(name: String, caloriesPerServing: Double, servingInGrams: Double, proteinsPerServing: Double, fatsPerServing: Double, carbohydratesPerServing: Double, quantity: Double) {
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
    