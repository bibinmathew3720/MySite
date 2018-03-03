//
//  CoreDatahandler.swift
//  Mysite
//
//  Created by Ryan Saleh on 19/02/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit
import CoreData

class CoreDatahandler: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
       return appDelegate.persistentContainer.viewContext
        
    }
    
    class func saveObject(name:String, date:String) -> Bool{
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Project", in: context)
        let manageObject = NSManagedObject(entity: entity!, insertInto: context)
        
        manageObject.setValue(name, forKey: "name")
        manageObject.setValue(date, forKey: "date")
        
        do{
            try context.save()
            return true
        }catch{
            return false
        }
        
        
    }
    
    class func fetchObject() -> [Project]?{
        let context = getContext()
        var project:[Project]? = nil
        do {
            project = try context.fetch(Project.fetchRequest())
            return project
            
        }catch{
            return project
            
        }
    }
}
