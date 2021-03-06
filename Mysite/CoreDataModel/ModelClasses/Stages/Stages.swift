//
//  Stages.swift
//  Mysite
//
//  Created by Bibin Mathew on 3/8/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit
import CoreData

class Stages: NSManagedObject {
    static func saveStageData(stageData:Dictionary<String, String>){
        var stage:Stages!
        if let stag = getStageofproject(projectId: stageData["projectId"]!, stageId: stageData["stageId"]!){
            stage = stag
        }
        else{
          stage  = CoreDataHandler.sharedInstance.newEntityForName(entityName: "Stages") as? Stages
        }
        stage?.projectId =  stageData["projectId"]
        stage?.stageName = stageData["stageName"]
        stage?.progress = stageData["progress"]
        stage?.timeFrom = stageData["timeFrom"]
        stage?.timeTo = stageData["timeTo"]
        stage?.workDetails = stageData["workDetails"]
        stage?.price = stageData["price"]
        stage?.stageId = stageData["stageId"]
        CoreDataHandler.sharedInstance.saveContext()
    }
    
    static func getStagesOfProject(projectId:String)->Array<Stages>{
        let predicate = NSPredicate(format: "projectId==%@", projectId)
         let stages = CoreDataHandler.sharedInstance.getAllDatasWithPredicate(entity: "Stages", predicate:predicate , sortDescriptor: nil)
        return stages as! Array<Stages>
    }
    
    static func getStageofproject(projectId:String,stageId:String)->Stages?{
        let predicate = NSPredicate(format: "projectId==%@ && stageId==%@", projectId, stageId)
        let stages = CoreDataHandler.sharedInstance.getAllDatasWithPredicate(entity: "Stages", predicate:predicate , sortDescriptor: nil)
        if let stage = stages.first{
            return stage as? Stages
        }
        else{
            return nil
        }
    }
}
