//
//  ViewController.swift
//  InstrumentsDemo
//
//  Created by Ashish Tyagi on 27/01/15.
//  Copyright (c) 2015 Ashish Tyagi. All rights reserved.x
//

import UIKit

class ViewController: UITableViewController {

    var smileysDao : ATSmileyDAO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        smileysDao = ATSmileyDAO.sharedInstance
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return smileysDao.getSmileys().count
    }

    // synchronous call
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("SmileyCell") as ATSmileyTableViewCell
        
        let smiley = smileysDao.getSmileys()[indexPath.row]
        cell.smileyImageView.image = smiley.getImage()
        return cell
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("SmileyCell") as ATSmileyTableViewCell
        
        let smiley = smileysDao.getSmileys()[indexPath.row]
        smiley.getImage(){(image: UIImage) -> () in
            var fetchedCell = tableView.cellForRowAtIndexPath(indexPath) as? ATSmileyTableViewCell
            if let sureCell = fetchedCell {
                fetchedCell!.setSmileyImage(image)
                fetchedCell!.setSmileyName(smiley.name)
            }
        }
    
        return cell
    }
    */

}

