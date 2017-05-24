//
//  NewTableViewCell.swift
//  APICall
//
//  Created by Manish Kumar on 05/01/17.
//  Copyright © 2017 appface. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var imageVieLAbel: UIImageView!
    
    @IBOutlet weak var labelView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
