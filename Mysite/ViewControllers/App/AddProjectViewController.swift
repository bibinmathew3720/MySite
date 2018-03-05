//
//  AddProjectViewController.swift
//  Mysite
//
//  Created by Bibin Mathew on 3/5/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class AddProjectViewController: UIViewController {

    @IBOutlet weak var locationTextFeild: UITextField!
    @IBOutlet weak var endingDateTextFeild: UITextField!
    @IBOutlet weak var startingDateTextFeild: UITextField!
    @IBOutlet weak var projectNameTextFeild: UITextField!
    var projectDict:[String:AnyObject] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func NextButtonAction(_ sender: Any) {
        
        projectDict["projectName"] = self.projectNameTextFeild.text as AnyObject
        projectDict["startDate"] = self.startingDateTextFeild.text as AnyObject
        projectDict["endDate"] = self.endingDateTextFeild.text as AnyObject
        projectDict["location"] = self.locationTextFeild.text as AnyObject
        
    }
    
    @IBAction func ViewTapAction(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addProjectToNextPage"){
            let addStageVC = segue.destination as! AddStageInsideVC
            addStageVC.projectDetail = projectDict
        }
    }

}
