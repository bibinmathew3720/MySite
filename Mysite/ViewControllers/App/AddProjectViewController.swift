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
            projectDict["url"] = shuffle() as AnyObject
            let uuid = NSUUID().uuidString
             projectDict["projectId"] = uuid as AnyObject
            print(uuid)
            Projects.saveProjectData(projectData: projectDict as! Dictionary<String, String>)
            performSegue(withIdentifier: "addProjectToNextPage", sender: nil)
        }
        
    }
    
    func shuffle() -> String {
        let videoLinks = [
            "https://www.youtube.com/watch?v=tzt9AgWBbcQ",
            "https://www.youtube.com/watch?v=8zjXK0FDzfI",
            "https://www.youtube.com/watch?v=bXAx8BDNbVU",
            "https://www.youtube.com/watch?v=ZTKETIvSys4",
            "https://www.youtube.com/watch?v=5nx68wxQCYk",
        ]
        let randomNumber = Int(arc4random_uniform(4))
        return videoLinks[randomNumber]
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
