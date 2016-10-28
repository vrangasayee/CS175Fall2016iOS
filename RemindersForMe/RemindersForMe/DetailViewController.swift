//
//  DetailViewController.swift
//  RemindersForMe
//
//  Created by Narayan Balasubramanian on 10/27/16.
//  Copyright © 2016 SJSU. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!

    var titleString: String = ""
    var dateString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = titleString
        self.dateLabel.text = dateString
    }

}

