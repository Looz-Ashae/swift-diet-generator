//
//  CaloricalNeedsCalculator.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 10/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit

final class CaloricalNeedsCalculator: NSObject {

    class func calculateDailyNeededCalories(weightWithoutFat : Double)-> Double {
        return 370 + (21.6 * weightWithoutFat)
    }
    
    class func calculateDailyNeededCaloriesForWeightLoss(weightWithoutFat : Double)-> Double {
        return 370 + (21.6 * weightWithoutFat) - (370 + (21.6 * weightWithoutFat)) * 0.15
    }
    
    class func calculateDailyNeededProteins(dailyNeededCalories : Double)-> Double {
        return dailyNeededCalories * 0.35
    }
    
    class func calculateDailyNeededProteinsForWeightLoss(dailyNeededCaloriesForWeightLoss : Double)-> Double {
        return dailyNeededCaloriesForWeightLoss * 0.45
    }
    
    class func calculateDailyNeededFats(dailyNeededCalories : Double)-> Double {
        return dailyNeededCalories * 0.25
    }
    
    class func calculateDailyNeededFatsForWeightLoss(dailyNeededCaloriesForWeightLoss : Double)-> Double {
        return dailyNeededCaloriesForWeightLoss * 0.15
    }
    
    class func calculateDailyNeededCarbohydrates(dailyNeededCalories : Double)-> Double {
        return dailyNeededCalories * 0.20
    }
    
    class func calculateDailyNeededCarbohydratesForWeightLoss(dailyNeededCaloriesForWeightLoss : Double)-> Double {
        return dailyNeededCaloriesForWeightLoss * 0.40
    }

}
