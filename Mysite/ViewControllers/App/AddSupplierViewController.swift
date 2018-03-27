//
//  AddSupplierViewController.swift
//  Mysite
//
//  Created by Hari on 27/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class AddSupplierViewController: UIViewController {

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
