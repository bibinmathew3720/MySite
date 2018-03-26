//
//  OwnerTableViewCell.swift
//  
//
//  Created by Hari on 13/03/18.
//

import UIKit

class OwnerTableViewCell: UITableViewCell {

    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var engineerName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setDocumentDetailOfProject(project:Projects){
        engineerName.text = project.conName ?? "Unknown"
        projectName.text = project.name
    }
    
}

