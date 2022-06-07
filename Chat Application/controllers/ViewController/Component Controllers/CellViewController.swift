//
//  CellView.swift
//  Chat Application
//
//  Created by Emir Kutlugün on 5.06.2022.
//

import UIKit

class CellView: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        super.layoutSubviews()
        
      
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 0 , right: 8   ))
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
