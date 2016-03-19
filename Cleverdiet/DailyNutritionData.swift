//
//  DailyNutritionData.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 11/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit

class DailyNutritionData: NSObject {
    let neededCalories : Double
    let neededProteins : Double
    let neededFats : Double
    let neededCarbohydrates : Double
    let neededCaloriesForWeightLoss : Double
    let neededProteinsForWeightLoss : Double
    let neededFatsForWeightLoss : Double
    let neededCarbohydratesForWeightLoss : Double
    
    init(weight : Double, fat : Double) {
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
