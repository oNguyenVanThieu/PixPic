//
//  User.swift
//  P-effect
//
//  Created by Jack Lapin on 15.01.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation

class User: PFUser {
    
    @NSManaged var avatar: PFFile?
    @NSManaged var facebookId: String?
    @NSManaged var appUsername: String?
    @NSManaged var passwordSet: Bool
    
    override class func initialize() {
        var onceToken: dispatch_once_t = 0;
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    override class func currentUser() -> User? {
        return PFUser.currentUser() as? User
    }
    
    static func sortedQuery() -> PFQuery {
        let query = PFQuery(className: User.parseClassName())
        query.orderByDescending("updatedAt")
        return query
    }
    
}
