//
//  AddStageInsideVC.swift
//  Mysite
//
//  Created by Ryan Saleh on 02/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class AddStageInsideVC: UIViewController {
    
    @IBOutlet weak var mainStackView: UIStackView!
    
    @IBOutlet weak var stage1StackView: UIStackView!
    @IBOutlet weak var stage2StackView: UIStackView!
    @IBOutlet weak var stage3StackView: UIStackView!
    @IBOutlet weak var stage4StackView: UIStackView!
    @IBOutlet weak var stage5StackView: UIStackView!
    @IBOutlet weak var stage6StackView: UIStackView!
    @IBOutlet weak var stage7StackView: UIStackView!
    @IBOutlet weak var stage8StackView: UIStackView!
    @IBOutlet weak var stage9StackView: UIStackView!
    @IBOutlet weak var stage10StackView: UIStackView!
    
    var projectDetail:[String:AnyObject] = [:]
   
    
    @IBOutlet weak var progressTextField: UITextField!
    @IBOutlet weak var stageNameTextFeild: UITextField!
    @IBOutlet weak var tag0STview: UIStackView!
    
    var count : Int = 0
    
    func counter(countsec : Int){
        
        count = count + 1
        
        if count == 1 {
            stage2StackView.isHidden = false
        }else if count == 2 {
            stage3StackView.isHidden = false
        }else if count == 3 {
            stage4StackView.isHidden = false
        }else if count == 4 {
            stage5StackView.isHidden = false
        }else if count == 5 {
            stage6StackView.isHidden = false
        }else if count == 6 {
            stage7StackView.isHidden = false
        }else if count == 7 {
            stage8StackView.isHidden = false
        }else if count == 8 {
            stage9StackView.isHidden = false
        }else if count == 9 {
            stage10StackView.isHidden = false
        }else if count>=10 {
            print ("maximum added")
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addBTNpressed(_ sender: UIButton) {
        
      //  counter(countsec: count)
        projectDetail["stageName"] = stageNameTextFeild.text as AnyObject
        projectDetail["progress"] = progressTextField.text as AnyObject
        Projects.saveProjectData(projectData: projectDetail as! Dictionary<String, String>)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func stage1BTN(_ sender: UIButton) {
        
    }
    
        
        
    }
    
        
   


