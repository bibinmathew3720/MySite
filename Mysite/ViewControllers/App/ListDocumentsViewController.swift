//
//  ListDocumentsViewController.swift
//  Mysite
//
//  Created by Hari on 12/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class ListDocumentsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var ListTableView: UITableView!
    var projectsArray = [Projects]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Documents"
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let data = Projects.getAllProjects() as? [Projects]
            
        {
            projectsArray = data
            ListTableView.reloadData()
        }
    }
    
    //Update Code
    
    
    
    // MARK: Table View Datasources
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return projectsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "documentCell", for: indexPath) as! DocumentTableViewCell
        cell.setDocumentDetailOfProject(project: projectsArray[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 291
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView=UIView()
        headerView.backgroundColor=UIColor.clear
        return headerView
    }
    
}

