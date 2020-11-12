//
//  CategoryTableViewCell.swift
//  YI
//
//  Created by Lina Li on 2020-11-09.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var FirstTableViewCell: UITableViewCell!
    @IBOutlet weak var FirstCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
