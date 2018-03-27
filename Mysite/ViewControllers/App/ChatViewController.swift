//
//  ChatViewController.swift
//  Mysite
//
//  Created by Hari on 13/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var chatTableView: UITableView!
    var projectsArray = [Projects]()
    override func viewDidLoad() {
        super.viewDidLoad()

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
            chatTableView.reloadData()
        }
    }
    
    // MARK: Table View Datasources
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! ChatTableViewCell
        cell.setDocumentDetailOfProject(project: projectsArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    


}
