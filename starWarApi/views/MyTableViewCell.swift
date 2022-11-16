//
//  MyTableViewCell.swift
//  starWarApi
//
//  Created by cheng on 11/11/22.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var eyeColorLabel: UILabel!
    
    @IBOutlet weak var hairColorLabel: UILabel!
    
    @IBOutlet weak var homeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
