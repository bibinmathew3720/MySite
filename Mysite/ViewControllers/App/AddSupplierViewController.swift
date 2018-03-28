//
//  AddSupplierViewController.swift
//  Mysite
//
//  Created by Hari on 27/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class AddSupplierViewController: BaseViewController {
    
    var supplierDict:[String:AnyObject] = [:]
    
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var supplierName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func AddButtonAction(_ sender: Any) {
        if(ValidateDetails()){
            supplierDict ["name"] = self.supplierName.text as AnyObject
            supplierDict ["phone"] = self.phoneNumber.text as AnyObject
            Supplier.saveSupplierDetails(supplierData: supplierDict as! Dictionary<String, String>)
            self.showAlertWithMessage(alertMessage: "Supplier added successfully")
            clearAllFields()
        }
    }
    
    func ValidateDetails() -> Bool {
        var isValid:Bool = false
        var messageString:String?
        if(self.supplierName.text?.isEmpty)! {
            messageString = "Please enter supplier name"
        } else if(self.phoneNumber.text?.isEmpty)! {
            messageString = "Please enter supplier phone number"
        } else {
            isValid = true
        }
        if !isValid {
            self.showAlertWithMessage(alertMessage: messageString!)
        }
        return isValid
    }
    
    func clearAllFields(){
        self.supplierName.text = ""
        self.phoneNumber.text = ""
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
