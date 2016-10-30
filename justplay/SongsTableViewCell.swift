//
//  SongsTableViewCell.swift
//  justPlay
//
//  Created by Justin Naing on 10/29/16.
//  Copyright © 2016 JIT. All rights reserved.
//

import UIKit

class SongsTableViewCell: UITableViewCell {

   @IBOutlet weak var mainLabel: UILabel!
   @IBOutlet weak var artistLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
