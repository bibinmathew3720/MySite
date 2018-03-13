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
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var addStageButton: UIButton!
    
    var stageDetails:Stages!
    var stageDict:[String:AnyObject] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        if let stage = stageDetails{
            populateStageDetails(stage: stage)
        }
    }
    
    func populateStageDetails(stage:Stages){
        stageNameTextFeild.text = stage.stageName
        progressTextField.text = stage.progress
        timeFromTextField.text = stage.timeFrom
        timeToTextField.text = stage.timeTo
        workDetails.text = stage.workDetails
        pricingTextField.text = stage.price
        nextButton.isHidden = true
        addStageButton.setTitle("Update", for: UIControlState.normal)
    }

    

    @IBAction func addBTNpressed(_ sender: UIButton) {

        if(ValidateDetails()){
            
            stageDict["stageName"] = stageNameTextFeild.text as AnyObject
            stageDict["progress"] = progressTextField.text as AnyObject
            stageDict["timeFrom"] = timeFromTextField.text as AnyObject
            stageDict["timeTo"] = timeToTextField.text as AnyObject
            stageDict["workDetails"] = workDetails.text as AnyObject
            stageDict["price"] = pricingTextField.text as AnyObject
            
            if let stage = stageDetails{
                stageDict["projectId"] = stage.projectId as AnyObject
                stageDict["stageId"] = stage.stageId as AnyObject
                showAlertWithMessage(alertMessage: "Stage details updated successfully")
            }
            else{
                stageDict["projectId"] = projectDetail["projectId"]
                let uuid = NSUUID().uuidString
                stageDict["stageId"] = uuid as AnyObject
                clearTextFields()
            }
            Stages.saveStageData(stageData: stageDict as! Dictionary<String, String>)
            
            
        }
    }
    
    func clearTextFields(){
        self.stageNameTextFeild.text = ""
        self.progressTextField.text = ""
        self.timeFromTextField.text = ""
        self.timeToTextField.text = ""
        self.workDetails.text = ""
        self.pricingTextField.text = ""
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
    //stageToDocumentsPage
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "stageToDocumentsPage"){
            let documentPage = segue.destination as! AddDocumentViewController
            documentPage.projectDetail = self.projectDetail
        }
    }
    
}
