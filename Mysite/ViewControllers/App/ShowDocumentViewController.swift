//
//  ShowDocumentViewController.swift
//  Mysite
//
//  Created by Hari on 08/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class ShowDocumentViewController: UIViewController {
    
    @IBOutlet weak var documentName: UILabel!
    @IBOutlet weak var documentImageView: UIImageView!
    @IBOutlet weak var documentDetails: UILabel!
    var isFromMenu:Bool?
    var projectId:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        populateDocumentDetails()
    }
    
    func populateDocumentDetails(){
        if !isFromMenu!{
        let project = Projects.getProjectData(projectId: projectId!)
        self.documentName.text = project.documentName
        self.documentDetails.text = project.documentDetail
        let imageIdentifier = project.projectId! + ".jpg"
        self.documentImageView.image = Utilities().getImage(identifier: imageIdentifier)
        }
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
