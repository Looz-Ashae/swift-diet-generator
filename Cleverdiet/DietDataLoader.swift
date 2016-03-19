//
//  DietDataLoader.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 9/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit
import SWXMLHash

class DietDataLoader: NSObject {
    class func downloadFromDatabase(dataType : DietDataAttribute, dataText: String)-> Diet? {
        var diet = Diet()
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent("diets.cdata");
            do {
                let xml = SWXMLHash.parse(try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding) as String)
                for xmlDiet in xml["diets"]["diet"] {
                    diet.name = xmlDiet["name"].element!.text!
                    if (xmlDiet[dataType.rawValue].element!.text! == dataText) {
                        for xmlFood in xmlDiet["food"] {
                            diet.foods.append(FoodDataLoader.downloadFromDatabase(DietDataAttribute.Name, dataText: xmlFood["name"].element!.text!)!)
                        }
                    }
                }
            }
            catch {}
        }
        return diet
    }
    
    class func downloadFromDatabase()-> [Diet] {
        var diets = [Diet]()
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent("diets.cdata");
            do {
                let xml = SWXMLHash.parse(try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding) as String)
                for xmlDiet in xml["diets"]["diet"] {
                    diets.append(DietDataLoader.downloadFromDatabase(DietDataAttribute.Id, dataText: xmlDiet["id"].element!.text!)!)
                }
            }
            catch {}
        }
        return diets
    }
    
    class func loadToDatabase(diet : Diet)-> Bool {
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent("diets.cdata");
            do {
                var dietData = ""                                                                                                                    
                if (!NSFileManager.defaultManager().fileExistsAtPath(path)) {
                    dietData.appendContentsOf("<diets>")
                } else {
                    dietData.appendContentsOf(try String(contentsOfFile: path, encoding: NSUTF8StringEncoding))
                    dietData = dietData.stringByReplacingOccurrencesOfString("</diets>", withString: "")
                }
                dietData.appendContentsOf("<diet>\n<id>\(DietDataLoader.countElements()+1)</id>\n<name>\(diet.name!)</name>\n")
                for food in diet.foods {
                    dietData.appendContentsOf("<food>\n<name>\(food.name)</name>\n</food>\n")
                }
                dietData.appendContentsOf("</diet>\n</diets>")

                try dietData.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
                NSLog(try String(contentsOfFile: path, encoding: NSUTF8StringEncoding))
                return true
            }
            catch {}
        }
        return false
    }
    
    class func countElements()-> Int {
        var count = 0
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent("diets.cdata");
            do {
                let xml = SWXMLHash.parse(try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding) as String)
                for _ in xml["diets"]["diet"] {
                    count++;
                }
            }
                
            catch {
                return count
            }
        }
        return count
    }
}

enum DietDataAttribute: String {
    case Id = "id"
    case Name = "name"
}