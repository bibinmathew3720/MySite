//
//  LoginVO.swift
//  Mysite
//
//  Created by Ryan Saleh on 12/02/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class LoginVO: BaseViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logInButtonAction(_ sender: UIButton) {
        if(ValidateDetails()){
            let userDetail = UserDetails.getUserDetailsWithEmailIdAndPassword(emailId: emailTF.text!, password: passwordTF.text!)
            if(userDetail == nil){
                showAlertWithMessage(alertMessage: "Invalid login credentials")
            }
            else{
                UserDefaults.standard.set(self.emailTF.text, forKey: Constant.kEmailIdKey)
               performSegue(withIdentifier: "ownerLogInIdentifier", sender: sender)
            }
        }
    }
    
    func ValidateDetails() -> Bool {
        var isValid:Bool = false
        var messageString:String?
        if(self.emailTF.text?.isEmpty)! {
            messageString = "Please enter email id"
        } else if(self.passwordTF.text?.isEmpty)! {
            messageString = "Please enter password"
        }else {
            isValid = true
        }
        if !isValid {
            self.showAlertWithMessage(alertMessage: messageString!)
        }
        return isValid
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ownerLogInIdentifier"){
            let tabVC = segue.destination as! UITabBarController
            let navVC = tabVC.viewControllers![0] as! UINavigationController
            let projectVC = navVC.viewControllers[0] as! ProjectsVC
            projectVC.isContractor = false
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
