//
//  User.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 8/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import RealmSwift

final class User : Object {
    dynamic var name: String = ""
    dynamic var password: String = ""
    dynamic var height: Double = 0.0
    dynamic var weight: Double = 0.0
    dynamic var fat: Double = 0.0
    dynamic var dailyNutritionalData : DailyNutritionData?
    
    convenience required init(name : String, password:String, height: Double, weight: Double, fat: Double) {
        self.init()
        self.name = name
        self.password = password
        self.height = height
        self.weight = weight
        self.fat = fat
        self.dailyNutritionalData = DailyNutritionData(weight: weight, fat: fat)
    }
    
}
