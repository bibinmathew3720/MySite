//
//  ProjectsVC.swift
//  Mysite
//
//  Created by Ryan Saleh on 19/02/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit
import SideMenu

class ProjectsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    var projectsArray = [Projects]()
    @IBOutlet weak var plusButton: UIBarButtonItem!
    @IBOutlet var projectCollectionView: UICollectionView!
    var isContractor:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        if(isContractor)!{
            
        }
        else{
            navigationItem.rightBarButtonItem = nil
        }
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let data = Projects.getAllProjects() as? [Projects]
            
        {
            projectsArray = data
            self.projectCollectionView.reloadData()
        }
        
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projectsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCell", for: indexPath as IndexPath) as! ProjectCollectionViewCell
        cell.backgroundColor = UIColor.cyan
        let project = projectsArray[indexPath.row]
        cell.headingProjectLabel.text = project.name
        cell.placeLabel.text = project.location
        cell.dateLabel.text = project.startDate! + "-" + project.endDate!
        let imageIdentifier = project.projectId! + ".jpg"
        cell.peoductImageView.image = Utilities().getImage(identifier: imageIdentifier)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let width = (self.projectCollectionView?.frame.size.width)! - 10
        return CGSize(width: CGFloat(width / 2), height: 150)
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        performSegue(withIdentifier: "projectToDetail", sender: projectsArray[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "projectToDetail"){
            let projectDetail = segue.destination as! InsideProjectVC
            projectDetail.selProject = sender as! Projects
        }
    }
}


