//
//  SupplierViewController.swift
//  Mysite
//
//  Created by Hari on 27/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class SupplierViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var supplierTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.supplierTableView.delegate = self;
        self.title = "Suppliers"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table View Datasources
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//projectsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "supplierCell", for: indexPath) as! SupplierTableViewCell
       // cell.setDocumentDetailOfProject(project: projectsArray[indexPath.row])
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
    
    
}
