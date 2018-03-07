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
        let stage = CoreDataHandler.sharedInstance.newEntityForName(entityName: "Stages") as? Stages
        stage?.projectId =  stageData["projectId"]
        stage?.stageName = stageData["stageName"]
        stage?.progress = stageData["progress"]
        stage?.timeFrom = stageData["timeFrom"]
        stage?.timeTo = stageData["timeTo"]
        stage?.workDetails = stageData["workDetails"]
        stage?.price = stageData["price"]
        CoreDataHandler.sharedInstance.saveContext()
    }
}
