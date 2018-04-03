//
//  SlideViewController.swift
//  Mysite
//
//  Created by Hari on 12/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var usersListHeight: NSLayoutConstraint!
    @IBOutlet weak var ownerBottomLine: UIImageView!
    
    @IBOutlet weak var documentsTop: NSLayoutConstraint!
    @IBOutlet weak var ownerBtn: UIButton!
    @IBOutlet weak var supplierBtn: UIButton!
    @IBOutlet weak var supplierListHeight: NSLayoutConstraint!
    @IBOutlet weak var ownerListHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.bool(forKey: "loginType"){
            self.headingLabel.text = "CONTRACTOR"
        }else{
            self.headingLabel.text = "OWNER"
            self.supplierListHeight.constant = 0
            self.ownerListHeight.constant = 0
            self.documentsTop.constant = -5
            self.ownerBottomLine.isHidden = true
            self.supplierBtn.isHidden = true
            self.ownerBtn.isHidden = true
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DocumentsButtonAction(_ sender: Any) {
        
    }
}
