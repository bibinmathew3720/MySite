//
//  SupplierTableViewCell.swift
//  Mysite
//
//  Created by Hari on 27/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class SupplierTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func CallButtonAction(_ sender: Any) {
        
    }
    
}
