//
//  FoodDataLoader.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 8/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit
import SWXMLHash

final class FoodDataLoader {
    class func downloadFromDatabase(dataType : DietDataAttribute, dataText: String)-> Food? {
        if let path = NSBundle.mainBundle().pathForResource("Food", ofType:"cdata") {
            do {
                let xml = SWXMLHash.parse(try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding) as String)
                for element in xml["foods"]["food"] {
                    if (element[dataType.rawValue].element!.text! == dataText) {
                        return Food(name: element[FoodDataAttribute.Name.rawValue].element!.text!,
                            caloriesPerServing: Double(element[FoodDataAttribute.CaloriesPerServing.rawValue].element!.text!)!,
                            servingInGrams: Double(element[FoodDataAttribute.ServingInGrams.rawValue].element!.text!)!,
                            proteinsPerServing: Double(element[FoodDataAttribute.ProteinsPerServing.rawValue].element!.text!)!,
                            fatsPerServing: Double(element[FoodDataAttribute.FatsPerServing.rawValue].element!.text!)!,
                            carbohydratesPerServing: Double(element[FoodDataAttribute.CarbohydratesPerServing.rawValue].element!.text!)!,
                            quantity: Double(element[FoodDataAttribute.Quantity.rawValue].element!.text!)!)
                    }
                }
            }
                
            catch {}
        }
        return nil
    }
    
    class func downloadFromDatabase(dataType : FoodDataAttribute, dataText: String)-> [Food] {
        var foods = [Food]()
        if let path = NSBundle.mainBundle().pathForResource("Food", ofType:"cdata") {
            do {
                let xml = SWXMLHash.parse(try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding) as String)
                for element in xml["foods"]["food"] {
                    if (element[dataType.rawValue].element!.text! == dataText) {
                        foods.append(Food(name: element[FoodDataAttribute.Name.rawValue].element!.text!,
                            caloriesPerServing: Double(element[FoodDataAttribute.CaloriesPerServing.rawValue].element!.text!)!,
                            servingInGrams: Double(element[FoodDataAttribute.ServingInGrams.rawValue].element!.text!)!,
                            proteinsPerServing: Double(element[FoodDataAttribute.ProteinsPerServing.rawValue].element!.text!)!,
                            fatsPerServing: Double(element[FoodDataAttribute.FatsPerServing.rawValue].element!.text!)!,
                            carbohydratesPerServing: Double(element[FoodDataAttribute.CarbohydratesPerServing.rawValue].element!.text!)!,
                            quantity: Double(element[FoodDataAttribute.Quantity.rawValue].element!.text!)!))
                    }
                }
            }
                
            catch {}
        }
        return foods
    }
    
    class func countElements()-> Int {
        var count = 0
        if let path = NSBundle.mainBundle().pathForResource("Food", ofType:"cdata") {
            do {
                let xml = SWXMLHash.parse(try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding) as String)
                for _ in xml["foods"]["food"] {
                    count++;
                }
            }
                
            catch {}
        }
        return count
    }
}

enum FoodDataAttribute: String {
    case Name = "name"
    case CaloriesPerServing = "caloriesPerServing"
    case ServingInGrams = "servingInGrams"
    case ProteinsPerServing = "proteinsPerServing"
    case FatsPerServing = "fatsPerServing"
    case CarbohydratesPerServing = "carbohydratesPerServing"
    case Quantity = "quantity"
}