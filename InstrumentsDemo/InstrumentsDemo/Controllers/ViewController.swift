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
        
        //following TAPAN's advice that synchronous calls on UI thread are the best mechanism for fetching images
        let smiley = smileysDao.getSmileys()[indexPath.row]
        cell.setSmileyName(smiley.name)
        cell.smileyImageView.image = smiley.getImage()
        return cell
    }

    
    /*
    //following TAPAN's update that synchronous calls on UI thread are the worst mechanism for fetching images
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("SmileyCell") as ATSmileyTableViewCell
        
        let smiley = smileysDao.getSmileys()[indexPath.row]
        cell.setSmileyName(smiley.name)
        
        cell.setSmileyImage(UIImage(named: "placeholder.png")!)
        
        //cell.setSmileyImage(UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("placeholder", ofType: "png")!)!)
        
        smiley.getImage(){(image: UIImage) -> () in
            var fetchedCell = tableView.cellForRowAtIndexPath(indexPath) as? ATSmileyTableViewCell
            if let sureCell = fetchedCell {
                fetchedCell!.setSmileyImage(image)
            }
        }
    
        return cell
    }
    */

}

