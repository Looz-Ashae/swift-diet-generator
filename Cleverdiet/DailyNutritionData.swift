//
//  DailyNutritionData.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 11/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import RealmSwift

class DailyNutritionData: Object {
    dynamic var neededCalories : Double = 0.0
    dynamic var neededProteins : Double = 0.0
    dynamic var neededFats : Double = 0.0
    dynamic var neededCarbohydrates : Double = 0.0
    dynamic var neededCaloriesForWeightLoss : Double = 0.0
    dynamic var neededProteinsForWeightLoss : Double = 0.0
    dynamic var neededFatsForWeightLoss : Double = 0.0
    dynamic var neededCarbohydratesForWeightLoss : Double = 0.0
    
    convenience required init(weight : Double, fat : Double) {
        self.init()
        self.neededCalories = CaloricalNeedsCalculator.calculateDailyNeededCalories(weight - weight * (fat * 0.01))
        self.neededProteins = CaloricalNeedsCalculator.calculateDailyNeededProteins(weight)
        self.neededFats = CaloricalNeedsCalculator.calculateDailyNeededFats(weight)
        self.neededCarbohydrates = CaloricalNeedsCalculator.calculateDailyNeededCarbohydrates(weight)
        
        self.neededCaloriesForWeightLoss = CaloricalNeedsCalculator.calculateDailyNeededCaloriesForWeightLoss(weight - weight * (fat * 0.01))
        self.neededProteinsForWeightLoss = CaloricalNeedsCalculator.calculateDailyNeededProteinsForWeightLoss(weight)
        self.neededFatsForWeightLoss = CaloricalNeedsCalculator.calculateDailyNeededFatsForWeightLoss(weight)
        self.neededCarbohydratesForWeightLoss = CaloricalNeedsCalculator.calculateDailyNeededCarbohydratesForWeightLoss(weight)
    }
    
}
