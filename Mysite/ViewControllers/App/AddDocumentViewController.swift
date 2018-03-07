//
//  AddDocumentViewController.swift
//  Mysite
//
//  Created by Hari R Krishna on 07/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class AddDocumentViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
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
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
   //MARK: - Take image
    @IBAction func camerButtonAction(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: - Done image capture here
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        documentImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
}
    

