//
//  UserManager.swift
//  Cleverdiet
//
//  Created by Jose L Molina on 15/4/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import Foundation

class UserManager: NSObject {
    static let sharedInstance = UserManager()
    var currentUser : User?
}