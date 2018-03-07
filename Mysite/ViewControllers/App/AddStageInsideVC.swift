//
//  AddStageInsideVC.swift
//  Mysite
//
//  Created by Ryan Saleh on 02/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class AddStageInsideVC: BaseViewController {
    
    var projectDetail:[String:AnyObject] = [:]
   
    @IBOutlet weak var stageNameTextFeild: UITextField!
    @IBOutlet weak var progressTextField: UITextField!
    @IBOutlet var timeFromTextField: UITextField!
    @IBOutlet var timeToTextField: UITextField!
    @IBOutlet var workDetails: UITextField!
    @IBOutlet var pricingTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    

    @IBAction func addBTNpressed(_ sender: UIButton) {

        if(ValidateDetails()){
            projectDetail["stageName"] = stageNameTextFeild.text as AnyObject
            projectDetail["progress"] = progressTextField.text as AnyObject
            Projects.saveProjectData(projectData: projectDetail as! Dictionary<String, String>)
        }
    }
    
    
    
    @IBAction func NextButtonAction(_ sender: Any) {
        //Navigate To Documents Add Screen
    }
    
    func ValidateDetails() -> Bool {
        var isValid:Bool = false
        var messageString:String?
        if(self.stageNameTextFeild.text?.isEmpty)! {
            messageString = "Please enter project status"
        } else if(self.progressTextField.text?.isEmpty)! {
            messageString = "Please enter progress"
        }else if(self.timeFromTextField.text?.isEmpty)! {
            messageString = "Please entere time from"
        }else if(self.timeToTextField.text?.isEmpty)! {
            messageString = "Please enter time to"
        }else if(self.workDetails.text?.isEmpty)! {
            messageString = "Please enter work details"
        }else if(self.pricingTextField.text?.isEmpty)! {
            messageString = "Please enter pricing"
        }else {
            isValid = true
        }
        if !isValid {
            self.showAlertWithMessage(alertMessage: messageString!)
        }
        return isValid
    }
    
}
