//
//  SupplierTableViewCell.swift
//  Mysite
//
//  Created by Hari on 27/03/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

protocol SupplierTableViewCellDelegate:class{
    func callPhone(index:Int)
}

class SupplierTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    weak var delegate:SupplierTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSupplierDetails(supplier:Supplier){
        self.name.text = supplier.name
        self.number.text = supplier.phoneNo
    }
    @IBAction func CallButtonAction(_ sender: Any) {
        delegate?.callPhone(index: self.tag)
    }
    
}
