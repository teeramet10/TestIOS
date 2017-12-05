//
//  UserTableViewCell.swift
//  MyApp
//
//  Created by teeramet kanchanapiroj on 12/5/2560 BE.
//  Copyright © 2560 teeramet kanchanapiroj. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var tvNam: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
