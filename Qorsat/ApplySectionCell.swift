//
//  ApplySectionCell.swift
//  Qorsat
//
//  Created by Ahsan Mughal on 02/03/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class ApplySectionCell: UITableViewCell {
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            frame.origin.x += 10
            frame.size.width -= 2 * 10
            super.frame = frame
        }
    }

    @IBOutlet weak var countryImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
        // Initialization code
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
