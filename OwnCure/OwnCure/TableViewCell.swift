//
//  TableViewCell.swift
//  OwnCure
//
//  Created by Haidar Rais on 11/24/17.
//  Copyright © 2017 Haidar Rais. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var labelpenyakit: UILabel!
    @IBOutlet weak var labelpenyebab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
