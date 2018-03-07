//
//  AddProjectViewController.swift
//  Mysite
//
//  Created by Bibin Mathew on 3/5/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class AddProjectViewController: BaseViewController {

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
        if(ValidateDetails()){
            projectDict["projectName"] = self.projectNameTextFeild.text as AnyObject
            projectDict["startDate"] = self.startingDateTextFeild.text as AnyObject
            projectDict["endDate"] = self.endingDateTextFeild.text as AnyObject
            projectDict["location"] = self.locationTextFeild.text as AnyObject
            let uuid = NSUUID().uuidString
             projectDict["projectId"] = uuid as AnyObject
            print(uuid)
            Projects.saveProjectData(projectData: projectDict as! Dictionary<String, String>)
            performSegue(withIdentifier: "addProjectToNextPage", sender: nil)
        }
        
    }
    
    func ValidateDetails() -> Bool {
        var isValid:Bool = false
        var messageString:String?
        if(self.projectNameTextFeild.text?.isEmpty)! {
            messageString = "Please enter project name"
        } else if(self.startingDateTextFeild.text?.isEmpty)! {
            messageString = "Please enter project start date"
        } else if(self.endingDateTextFeild.text?.isEmpty)! {
            messageString = "Please enter project end date"
        }
        else if(self.locationTextFeild.text?.isEmpty)! {
            messageString = "Please enter project location"
        } else {
            isValid = true
        }
        if !isValid {
            self.showAlertWithMessage(alertMessage: messageString!)
        }
        return isValid
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
