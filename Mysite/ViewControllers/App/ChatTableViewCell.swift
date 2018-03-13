//
//  ChatTableViewCell.swift
//  Mysite
//
//  Created by Hari on 13/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
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
        engineerName.text = project.engName ?? "Unknown"
        projectName.text = project.name
    }

}
