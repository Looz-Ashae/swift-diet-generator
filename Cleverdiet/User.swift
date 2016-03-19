//
//  User.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 8/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit

struct User : XMLSerializable {
    let name: String
    let height: Double
    let weight: Double
    let fat: Double
    let dailyNutritionalData : DailyNutritionData
    
    init(name : String, height: Double, weight: Double, fat: Double) {
        self.name = name
        self.height = height
        self.weight = weight
        self.fat = fat
        self.dailyNutritionalData = DailyNutritionData(weight: weight, fat: fat)
    }
    
    func toXML()-> String {
        return "<name>\(name)</name>\n<height>\(height)</height>\n<weight>\(weight)</weight>\n<fat>\(fat)</fat>"
    }
    
}
