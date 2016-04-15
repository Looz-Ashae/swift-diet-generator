//
//  DietDataLoader.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 9/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit
import RealmSwift

class DietDataLoader: NSObject {
    class func downloadFromDatabase(dataType : DietDataAttribute, dataText: String)-> Diet? {
        do {
            let realm = try Realm()
            return realm.objects(Diet).filter("\(dataType) = '\(dataText)'").first;
        } catch {
            return nil
        }
    }
    
    class func downloadFromDatabase()-> [Diet]? {
        do {
            let realm = try Realm()
            return Array(realm.objects(Diet));
        } catch {
            return nil
        }
    }
    
    class func loadToDatabase(diet : Diet)-> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(diet)
            }
            return true
        } catch {
            return false
        }
    }
    
    class func countElements()-> Int {
        do {
            let realm = try Realm()
            return realm.objects(Diet).count
        } catch {
            return 0
        }
    }
}

enum DietDataAttribute: String {
    case Id = "id"
    case Name = "name"
}