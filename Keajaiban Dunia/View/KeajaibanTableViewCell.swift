//
//  KeajaibanTableViewCell.swift
//  Keajaiban Dunia
//
//  Created by Muhammad Harviando on 17/06/21.
//  Copyright © 2021 Prince Alvin Yusuf. All rights reserved.
//

import UIKit

class KeajaibanTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
