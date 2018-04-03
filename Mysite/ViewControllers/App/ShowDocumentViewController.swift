//
//  ShowDocumentViewController.swift
//  Mysite
//
//  Created by Hari on 08/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class ShowDocumentViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate {
    
    @IBOutlet weak var documentName: UILabel!
    @IBOutlet weak var documentImageView: UIImageView!
    @IBOutlet weak var documentDetails: UILabel!
    var imagePicker: UIImagePickerController!
    var projectId:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        populateDocumentDetails()
    }
    
    func populateDocumentDetails(){
        let project = Projects.getProjectData(projectId: projectId!)
        self.documentName.text = project.documentName
        self.documentDetails.text = project.documentDetail
        let imageIdentifier = project.projectId! + ".jpg"
        self.documentImageView.image = Utilities().getImage(identifier: imageIdentifier)
    }
    @IBAction func editImageAction(_ sender: UIButton) {
      
        
        
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        documentImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        let imageIdentifier = projectId + ".jpg"
        Utilities().saveImageDocumentDirectory(image: documentImageView.image!, identifier: imageIdentifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
