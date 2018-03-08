//
//  ProjectDetailTableViewCell.swift
//  Mysite
//
//  Created by Hari on 07/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class ProjectDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var stageNameLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var projectDetailLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setStageDetails(stageDetail:Stages){
        self.stageNameLabel.text = stageDetail.stageName
        if let pr = Float(stageDetail.progress!) {
            self.progressView.progress = Float(pr/100)
            self.progressLabel.text = stageDetail.progress!+"%"
        }
        self.projectDetailLabel.text = stageDetail.workDetails
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
