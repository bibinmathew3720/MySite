//
//  Supplier.swift
//  Mysite
//
//  Created by Bibin Mathew on 3/28/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit
import CoreData

class Supplier: NSManagedObject {

    static func saveSupplierDetails(supplierData:Dictionary<String,String>){
        let supplier = CoreDataHandler.sharedInstance.newEntityForName(entityName: "Supplier") as! Supplier
        supplier.name = supplierData["name"]
        supplier.phoneNo = supplierData["phone"]
        CoreDataHandler.sharedInstance.saveContext()
    }
    
    static func getAllSuppliers()->Array<Any>{
        let supplierList = CoreDataHandler.sharedInstance.getAllDatas(entity: "Supplier")
        return supplierList
    }
}
