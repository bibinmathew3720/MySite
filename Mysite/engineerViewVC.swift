//
//  engineerViewVC.swift
//  Mysite
//
//  Created by Ryan Saleh on 18/02/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class engineerViewVC: UIViewController {
    
    
    
    @IBAction func phoneBTNpressed(_ sender: UIButton) {
        
        
        guard let number = URL(string: "telprompt://123456789") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number)
        } else {
            // Fallback on earlier versions
            UIApplication.shared.openURL(number)
        }
       
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func mailBTNpressed(_ sender: UIButton) {
        
        guard let email = URL(string: "mailto://email@email.com") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(email)
//            print ("fine")
        } else {
            // Fallback on earlier versions
            UIApplication.shared.openURL(email)
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
