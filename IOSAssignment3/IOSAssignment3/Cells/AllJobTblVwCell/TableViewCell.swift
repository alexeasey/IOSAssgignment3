//
//  TableViewCell.swift
//  IOSAssignment3
//
//  Created by Umer on 11/05/2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var indexNoLbl: UILabel!
    @IBOutlet weak var jobDescLbl: UILabel!
    @IBOutlet weak var jobTitleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
