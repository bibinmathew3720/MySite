//
//  UserDetails.swift
//  Mysite
//
//  Created by Bibin Mathew on 3/4/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit
import CoreData

/* User Type
 1 = Contractor
 2 = Owner */

class UserDetails: NSManagedObject {
 
    static func saveUserData(userData:Dictionary<String, String>){
        var userDetail:UserDetails?
        userDetail = UserDetails.getUserDetailsWithEmailId(emailId:userData["emailID"]!)
        if(userDetail == nil){
            userDetail = CoreDataHandler.sharedInstance.newEntityForName(entityName: "UserDetails") as? UserDetails
        }
        userDetail?.firstName = userData["firstName"]
        userDetail?.lastName = userData["lastName"]
        userDetail?.email = userData["emailID"]
        userDetail?.phoneNo = userData["phoneNo"]
        userDetail?.password = userData["password"]
        CoreDataHandler.sharedInstance.saveContext()
    }
    
    static func getUserDetailsWithEmailId(emailId:String)->UserDetails?{
        let predicate = NSPredicate(format: "email==%@", emailId)
        let userData = CoreDataHandler.sharedInstance.getAllDatasWithPredicate(entity: "UserDetails", predicate:predicate , sortDescriptor: nil)
        if(userData.count == 0){
            return nil;
        }
        else{
            return userData.first as? UserDetails
        }
        
    }
    
    static func getUserDetailsWithEmailIdAndPassword(emailId:String,password:String)->UserDetails?{
        let predicate = NSPredicate(format: "email==%@ && password ==%@", emailId,password)
        let userData = CoreDataHandler.sharedInstance.getAllDatasWithPredicate(entity: "UserDetails", predicate:predicate , sortDescriptor: nil)
        if(userData.count == 0){
            return nil;
        }
        else{
            return userData.first as? UserDetails
        }
        
    }
}
