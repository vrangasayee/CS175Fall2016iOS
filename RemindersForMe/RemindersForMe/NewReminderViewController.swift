//
//  NewReminderViewController.swift
//  RemindersForMe
//
//  Created by Narayan Balasubramanian on 10/27/16.
//  Copyright © 2016 SJSU. All rights reserved.
//

import UIKit

class NewReminderViewController: UIViewController {
    var delegate: ReminderProtocol!

    
    @IBOutlet var timestamp: UITextField!
    @IBOutlet var reminder: UITextField!
    @IBAction func clearText(sender: UITextField) {
        sender.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func submit(sender: UIButton) {
        delegate.receivedNewReminder(reminder.text!, timestamp: timestamp.text!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
