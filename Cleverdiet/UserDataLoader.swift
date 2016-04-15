//
//  UserDataLoader.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 8/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit
import RealmSwift

final class UserDataLoader: NSObject {
    class func downloadFromDatabase(username: String)-> User? {
        do {
            let realm = try Realm()
            return realm.objects(User).filter("name = '\(username)'").first;
        } catch {
            return nil
        }
    }
    
    class func userExists(username: String, password: String)-> Bool {
        do {
            let realm = try Realm()
            return realm.objects(User).filter("name = '\(username)' AND password = '\(password)'").count > 0;
        } catch {
            return false
        }
    }
    
    class func createUser(user : User)-> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(user)
            }
            return true
        } catch {
            return false
        }
    }
}

enum UserDataAttribute: String {
    case Name = "name"
    case Password = "password"
    case Height = "height"
    case Weight = "weight"
    case Fat = "fat"
}
