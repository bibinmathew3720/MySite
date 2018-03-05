//
//  ProjectsVC.swift
//  Mysite
//
//  Created by Ryan Saleh on 19/02/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit
import SideMenu

class ProjectsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

        @IBOutlet var projectCollectionView: UICollectionView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }

    // MARK: - UICollectionViewDataSource protocol
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCell", for: indexPath as IndexPath) as! ProjectCollectionViewCell
        cell.backgroundColor = UIColor.cyan
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    }

