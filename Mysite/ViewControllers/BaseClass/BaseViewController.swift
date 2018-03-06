//
//  BaseViewController.swift
//  Mysite
//
//  Created by Bibin Mathew on 3/4/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showAlertWithMessage(alertMessage:String){
        let alertController = UIAlertController.init(title: "Warning", message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
