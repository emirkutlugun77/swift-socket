//
//  TableViewCell.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 8.06.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var textField: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
