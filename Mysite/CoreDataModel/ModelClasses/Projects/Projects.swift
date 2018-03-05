//
//  Projects.swift
//  Mysite
//
//  Created by Bibin Mathew on 3/5/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit
import CoreData

class Projects: NSManagedObject {
    static func saveProjectData(projectData:Dictionary<String, String>){
        let project = CoreDataHandler.sharedInstance.newEntityForName(entityName: "Projects") as? Projects
        project?.name = projectData["projectName"]
        project?.location = projectData["location"]
        project?.startDate = projectData["startDate"]
        project?.endDate = projectData["endDate"]
        project?.stage = projectData["stageName"]
        project?.progress = projectData["progress"]
        CoreDataHandler.sharedInstance.saveContext()
    }
    
    static func getAllProjects()->Array<Any>?{
        let projects = CoreDataHandler.sharedInstance.getAllDatasWithPredicate(entity: "Projects", predicate:nil , sortDescriptor: nil)
        if(projects.count == 0){
            return nil;
        }
        else{
            return projects as Array
        }
        
    }
}
