//
//  DocumentTableViewCell.swift
//  Mysite
//
//  Created by Hari on 12/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {

    @IBOutlet weak var documentDesLabel: UILabel!
    @IBOutlet weak var documentNameLabel: UILabel!
    @IBOutlet weak var docImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDocumentDetailOfProject(project:Projects){
        documentNameLabel.text = project.documentName
        documentDesLabel.text = project.documentDetail
        let imageIdentifier = project.projectId! + ".jpg"
        docImageView.image = Utilities().getImage(identifier: imageIdentifier)
        
    }

}
