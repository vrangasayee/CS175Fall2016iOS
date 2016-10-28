//
//  ReminderTableViewCell.swift
//  TinyReminders
//
//  Created by Narayan Balasubramanian on 10/27/16.
//  Copyright © 2016 SJSU. All rights reserved.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet var reminderDate: UILabel!
    @IBOutlet var reminderTitle: UILabel!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
