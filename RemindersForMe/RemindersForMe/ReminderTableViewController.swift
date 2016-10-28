//
//  MasterViewController.swift
//  RemindersForMe
//
//  Created by Narayan Balasubramanian on 10/27/16.
//  Copyright © 2016 SJSU. All rights reserved.
//

import UIKit
protocol ReminderProtocol {
    func receivedNewReminder(reminder: String, timestamp: String)
}

struct Reminder {
    var title : String
    var timestamp : String
}
class ReminderTableViewController : UITableViewController, ReminderProtocol {
    
    func receivedNewReminder(title: String, timestamp: String) {
        let reminder = Reminder(title: title, timestamp: timestamp)
        reminders.append(reminder)
        self.tableView.reloadData()
    }
    var detailViewController: DetailViewController? = nil
    
    struct Reminder {
        var title : String
        var timestamp : String
    }
    
    var objects = [AnyObject]()
    var reminders : [Reminder] = [
        Reminder(title:"Call mom", timestamp:"eventually"),
        Reminder(title:"Call sister", timestamp:"never"),
        Reminder(title: "Reading assignment", timestamp: "When I find time")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch(segue.identifier!) {
            case "showDetail":
            if let controller = (segue.destinationViewController as! UINavigationController).topViewController as? DetailViewController {
                    if let cell = sender as? ReminderTableViewCell {
                        controller.titleString = cell.title.text!
                        controller.dateString = cell.date.text!
                    }
                    
            }
        case "addNew":
            if let secondViewController = segue.destinationViewController as? NewReminderViewController {
                secondViewController.delegate = self
            }
        default:
            break
        }

    }


    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as?
            ReminderTableViewCell ?? ReminderTableViewCell()

        cell.title.text = reminders[indexPath.row].title
        cell.date.text = reminders[indexPath.row].timestamp
        return cell
    }
    
    

}

