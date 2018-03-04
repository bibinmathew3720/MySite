//
//  signupVC.swift
//  Mysite
//
//  Created by Ryan Saleh on 09/02/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class signupVC: BaseViewController {
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPwdTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signUpAction(_ sender: UIButton) {
        if(ValidateDetails()){
            self.saveUserDetailsToDB()
            performSegue(withIdentifier: "showHomePageSegue", sender: sender)
        }
    }
    
    
    func ValidateDetails() -> Bool {
        var isValid:Bool = false
        var messageString:String?
        
        if(self.firstNameTF.text?.isEmpty)! {
            messageString = "Please enter first name"
        } else if(self.lastNameTF.text?.isEmpty)! {
            messageString = "Please enter last name"
        } else if(self.emailTF.text?.isEmpty)! {
            messageString = "Please enter email id"
        }
        else if(self.phoneTF.text?.isEmpty)! {
            messageString = "Please enter phone number"
        }else if(self.passwordTF.text?.isEmpty)! {
            messageString = "Please enter password"
        } else if(self.confirmPwdTF.text?.isEmpty)! {
            messageString = "Please enter confirm password"
        } else if(self.passwordTF.text != self.confirmPwdTF.text) {
            messageString = "Password mismatch"
        }  else {
            isValid = true
        }
        if !isValid {
            self.showAlertWithMessage(alertMessage: messageString!)
        }
        return isValid
    }
    
    func saveUserDetailsToDB(){
        var userDetailsDict:[String:AnyObject] = [:]
        userDetailsDict["firstName"] = self.firstNameTF.text as AnyObject
        userDetailsDict["lastName"] = self.lastNameTF.text as AnyObject
        userDetailsDict["emailID"] = self.emailTF.text as AnyObject
        userDetailsDict["phoneNo"] = self.phoneTF.text as AnyObject
        userDetailsDict["password"] = self.passwordTF.text as AnyObject
        UserDetails.saveUserData(userData: userDetailsDict as! Dictionary<String, String>)
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
