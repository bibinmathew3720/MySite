//
//  AddDocumentViewController.swift
//  Mysite
//
//  Created by Hari R Krishna on 07/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class AddDocumentViewController: BaseViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var projectDetail:[String:AnyObject] = [:]
    
    @IBOutlet var documentImageView: UIImageView!
    @IBOutlet var documentDetails: UITextField!
    @IBOutlet var documentName: UITextField!
    var imagePicker: UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func SubmitButtonAction(_ sender: Any) {
        if(ValidateDetails()){
            let imageIdentifier = projectDetail["projectId"] as! String + ".jpg"
            Utilities().saveImageDocumentDirectory(image: documentImageView.image!, identifier: imageIdentifier)
            print(Utilities().getImage(identifier: imageIdentifier))
            projectDetail["documentName"] = self.documentName.text as AnyObject
            projectDetail["documentDetail"] = self.documentDetails.text as AnyObject
            Projects.updateDocumentDetails(projectData: projectDetail as! Dictionary<String, String>)
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func ValidateDetails() -> Bool {
        var isValid:Bool = false
        var messageString:String?
        if(self.documentName.text?.isEmpty)! {
            messageString = "Please enter document name"
        } else if(self.documentDetails.text?.isEmpty)! {
            messageString = "Please enter document details"
        } else {
            isValid = true
        }
        if !isValid {
            self.showAlertWithMessage(alertMessage: messageString!)
        }
        return isValid
    }
    
   //MARK: - Take image
    @IBAction func camerButtonAction(_ sender: Any) {

        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "MySite", message: "Please select an option", preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
        
        let saveActionButton = UIAlertAction(title: "Camera", style: .default)
        { _ in
            self.imagePicker =  UIImagePickerController()
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        actionSheetControllerIOS8.addAction(saveActionButton)
        
        let deleteActionButton = UIAlertAction(title: "Library", style: .default)
        { _ in
            self.imagePicker =  UIImagePickerController()
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        actionSheetControllerIOS8.addAction(deleteActionButton)
        self.present(actionSheetControllerIOS8, animated: true, completion: nil)
    }
    
    //MARK: - Done image capture here
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        documentImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
}
    

