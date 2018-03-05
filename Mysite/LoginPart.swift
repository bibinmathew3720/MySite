//
//  LoginPart.swift
//  Mysite
//
//  Created by Ryan Saleh on 11/02/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class LoginPart: UIViewController {
    
    @IBOutlet weak var ContractorICN: UIButton!
    
    @IBOutlet weak var selectBOX: UIImageView!
    
    @IBOutlet weak var OwnerICN: UIButton!
    
    @IBOutlet weak var selectBOX2: UIImageView!
    
    @IBOutlet weak var Next2LoginBTN: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func ContractorBTN(_ sender: Any) {
        if selectBOX2.isHidden == false{
            selectBOX2.isHidden = true
    
            if selectBOX.isHidden == true{
                selectBOX.isHidden = false
                Next2LoginBTN.isHidden = false
            }else{
                selectBOX.isHidden = false
                Next2LoginBTN.isHidden = false
            }
        }else{
            if selectBOX.isHidden == true{
                selectBOX.isHidden = false
                Next2LoginBTN.isHidden = false
            }else{
                selectBOX.isHidden = false
                Next2LoginBTN.isHidden = false
            }
        }
    }
    @IBAction func OwnerBTN(_ sender: Any) {
        if selectBOX.isHidden == false{
            selectBOX.isHidden = true
            
            if selectBOX2.isHidden == true{
                selectBOX2.isHidden = false
                Next2LoginBTN.isHidden = false
            }else{
                selectBOX2.isHidden = false
                Next2LoginBTN.isHidden = false
            }
        }else{
            
            if selectBOX2.isHidden == true{
                selectBOX2.isHidden = false
                Next2LoginBTN.isHidden = false
            }else{
                selectBOX2.isHidden = false
                Next2LoginBTN.isHidden = false
            }
        }
    }
    
    @IBAction func Next2LogBTN(_ sender: Any) {
        
     // performSegue(withIdentifier: "logInPartToSignUp", sender: sender)
//        if Next2LoginBTN.isHidden == true{
//            if selectBOX.isHidden == false || selectBOX2.isHidden == false{
//                Next2LoginBTN.isHidden = false
//                     }
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "nextButtonToSignUp"){
            let signUp = segue.destination as! signupVC
            if(selectBOX.isHidden){
                signUp.isContractor = false
            }
            else{
                signUp.isContractor = true
            }
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
