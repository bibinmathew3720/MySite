//
//  SignINpart.swift
//  Mysite
//
//  Created by Ryan Saleh on 11/02/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class SignINpart: UIViewController {
    @IBOutlet weak var ContractorICN: UIButton!
    
    @IBOutlet weak var selectBOX: UIImageView!
    
    @IBOutlet weak var OwnerICN: UIButton!
    
    @IBOutlet weak var selectBOX2: UIImageView!
    
    @IBOutlet weak var ContractorBTN: UIButton!
    
    @IBOutlet weak var OwnerBTN: UIButton!
    
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
    
    @IBAction func GOnextBTN(_ sender: UIButton) {
        
        if selectBOX.isHidden == false {
            performSegue(withIdentifier: "GotoC", sender: self)
        }else if selectBOX2.isHidden == false{
            performSegue(withIdentifier: "GotoO", sender: self)
        }
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
