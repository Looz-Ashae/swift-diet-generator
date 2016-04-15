//
//  DietGenerator.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 10/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit

final class DietGenerator: NSObject {

    class func generateFor(user : User, withName: String)-> Diet {
        return (user.fat > 15) ? generateWeightLossDiet(user, withName: withName) : generateMaintenanceDiet(user, withName: withName);
    }
    
    private class func generateWeightLossDiet(user : User, withName: String)-> Diet {
        var diet = Diet()
        diet.name = withName
        var dietCalories = 0.0
        while (dietCalories < user.dailyNutritionalData.neededCaloriesForWeightLoss) {
            let food = FoodDataLoader.downloadFromDatabase(DietDataAttribute.Id, dataText: String(Int(arc4random_uniform(UInt32(FoodDataLoader.countElements())) + 1)))!
            if (!DietGenerator.foodIsConteinedInDiet(food, diet: diet)) {
                dietCalories += food.caloriesPerServing
                diet.foods.append(food)
            }
        }
        return diet
    }
    
    private class func generateMaintenanceDiet(user : User, withName: String)-> Diet {
        var diet = Diet()
        diet.name = withName
        var dietCalories = 0.0
        while (dietCalories < user.dailyNutritionalData.neededCalories) {
            let food = FoodDataLoader.downloadFromDatabase(DietDataAttribute.Id, dataText: String(Int(arc4random_uniform(UInt32(FoodDataLoader.countElements())) + 1)))!
            if (!DietGenerator.foodIsConteinedInDiet(food, diet: diet)) {
                dietCalories += food.caloriesPerServing
                diet.foods.append(food)
            }
        }
        return diet
    }
    
    private class func foodIsConteinedInDiet(food : Food, diet : Diet)-> Bool {
        for var element in diet.foods {
            if (element.name == food.name) {
                return true;
            }
        }
        return false
    }
    
}
