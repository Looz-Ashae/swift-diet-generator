//
//  UserDataLoader.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 8/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit
import SWXMLHash

final class UserDataLoader: NSObject {
    class func downloadFromDatabase()-> User? {
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent("user.cdata");
            do {
                let xml = SWXMLHash.parse(try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding) as String)
                return User(name: xml["user"][UserDataAttribute.Name.rawValue].element!.text!,
                    height: Double(xml["user"][UserDataAttribute.Height.rawValue].element!.text!)!,
                    weight: Double(xml["user"][UserDataAttribute.Weight.rawValue].element!.text!)!,
                    fat: Double(xml["user"][UserDataAttribute.Fat.rawValue].element!.text!)!)
            }
            catch {}
        }
        return nil
    }
    
    class func userExists(username: String, password: String)-> Bool {
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent("user.cdata");
            do {
                let xml = SWXMLHash.parse(try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding) as String)
                if (xml["user"][UserDataAttribute.Name.rawValue].element!.text! == username && xml["user"][UserDataAttribute.Password.rawValue].element!.text! == password) {
                    return true
                }
            }
            catch {}
        }
        return false
    }
    
    class func createUser(user : User, password : String)-> Bool {
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent("user.cdata");
            do {
                let userData = "<user>\n<password>\(password)</password>\n\(user.toXML())\n</user>"
                try userData.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
                return true
            }
            catch {}
        }
        return false
    }
}

enum UserDataAttribute: String {
    case Name = "name"
    case Password = "password"
    case Height = "height"
    case Weight = "weight"
    case Fat = "fat"
}
