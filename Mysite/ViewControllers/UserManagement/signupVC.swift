//
//  signupVC.swift
//  Mysite
//
//  Created by Ryan Saleh on 09/02/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class signupVC: BaseViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var termsAndServiceLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var paswordMiddleIcon: UIImageView!
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPwdTF: UITextField!
    
    var isFromEditProfile:Bool!
    
    var isContractor:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let isFromEdit = isFromEditProfile{
          populateUserDetails()
        }

        // Do any additional setup after loading the view.
    }
    
    func populateUserDetails(){
        self.signUpButton.setTitle("Update Profile", for: UIControlState.normal)
        self.backButton.isHidden = true
        self.termsAndServiceLabel.isHidden = true
        self.conditionLabel.isHidden = true
        self.passwordTF.isHidden = true
        self.confirmPwdTF.isHidden = true
        self.paswordMiddleIcon.isHidden = true
        self.title = "Update Profile"
        
        let emailId = UserDefaults.standard.value(forKey: Constant.kEmailIdKey)
        let userDetails = UserDetails.getUserDetailsWithEmailId(emailId: emailId as! String)
        self.firstNameTF.text = userDetails?.firstName
        self.lastNameTF.text = userDetails?.lastName
        self.emailTF.text = userDetails?.email
        self.phoneTF.text = userDetails?.phoneNo
        self.passwordTF.text = userDetails?.password
        self.confirmPwdTF.text = userDetails?.password
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signUpAction(_ sender: UIButton) {
        if(ValidateDetails()){
            self.saveUserDetailsToDB()
            if let isFromEdit = isFromEditProfile{
                self.showAlertWithMessage(alertMessage: "Profile Updated successfully")
            }
            else{
                performSegue(withIdentifier: "showHomePageSegue", sender: sender)
            }
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
        if let isCont = isContractor{
            userDetailsDict["userType"] = "1" as AnyObject
        }
        else{
            userDetailsDict["userType"] = "2" as AnyObject
        }
        UserDefaults.standard.set(self.emailTF.text, forKey: Constant.kEmailIdKey)
        UserDetails.saveUserData(userData: userDetailsDict as! Dictionary<String, String>)
    }
    
    @IBAction func leftButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showHomePageSegue"){
            let tabVC = segue.destination as! UITabBarController
            let navVC = tabVC.viewControllers![0] as! UINavigationController
            let projectVC = navVC.viewControllers[0] as! ProjectsVC
            projectVC.isContractor = isContractor
        }
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
