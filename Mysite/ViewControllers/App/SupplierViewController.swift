//
//  SupplierViewController.swift
//  Mysite
//
//  Created by Hari on 27/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class SupplierViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SupplierTableViewCellDelegate {

    var supplierList = [Supplier]()
    @IBOutlet weak var supplierTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.supplierTableView.delegate = self;
        self.title = "Suppliers"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         populateSupplierList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
    }
    
    func populateSupplierList(){
        supplierList = Supplier.getAllSuppliers() as! [Supplier]
        supplierTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table View Datasources
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return supplierList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//projectsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "supplierCell", for: indexPath) as! SupplierTableViewCell
        let supplier = supplierList[indexPath.section]
        cell.setSupplierDetails(supplier: supplier)
        cell.delegate = self
        cell.tag = indexPath.section
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView=UIView()
        headerView.backgroundColor=UIColor.clear
        return headerView
    }
    
    //MARK: Supplier Table View Cell Delegate
    
    func callPhone(index: Int) {
      let supplier = supplierList[index]
      callNumber(phoneNumber: supplier.phoneNo!)
    }
    
    private func callNumber(phoneNumber:String) {
        if let phoneCallURL:NSURL = NSURL(string:"tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL as URL)) {
                application.open(phoneCallURL as URL, options: [:], completionHandler: nil)
                //application.openURL(phoneCallURL as URL);
            }
        }
    }
    
    
}
