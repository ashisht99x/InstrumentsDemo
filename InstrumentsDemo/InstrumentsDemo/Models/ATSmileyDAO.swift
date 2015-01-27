//
//  ATSmileyDAO.swift
//  InstrumentsDemo
//
//  Created by Ashish Tyagi on 27/01/15.
//  Copyright (c) 2015 Ashish Tyagi. All rights reserved.
//

import Foundation

class ATSmileyDAO {
    
    let jsonName = "Smileys.json"
    let serverUrl = "http://10.133.20.133:8000/"
    private var smileys: Array<ATSmiley>!
    
    init() {
      self.smileys = smileysArray()
    }
    
    class var sharedInstance: ATSmileyDAO {
        //2
        struct Singleton {
            //3
            static let instance = ATSmileyDAO()
        }
        //4
        return Singleton.instance
    }
    
    func getSmileys() -> Array<ATSmiley> {
        return self.smileys
    }
    
    private func smileysArray() -> Array<ATSmiley> {
        
        var errorPointer: NSError?
        
        let filePath = NSBundle.mainBundle().pathForResource("Smileys", ofType: "json")
        
        let data = NSData(contentsOfFile:filePath!, options: NSDataReadingOptions.allZeros, error: &errorPointer)
        
        if let jsonData = data {
            var jsonDict = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: &errorPointer) as NSDictionary
            
            let smileyNames = jsonDict.objectForKey("smileys") as Array<NSDictionary>
            
            var smileys = Array<ATSmiley>()
            
            for ii in 0...smileyNames.count-1 {
                
                let smileyInfo = smileyNames[ii] as NSDictionary
                let smileyName = smileyInfo.objectForKey("name") as String
                let smileyUrl = "\(serverUrl)\(smileyName)"
                
                var smiley = ATSmiley(name: smileyName, imageUrl: smileyUrl)
                smileys.append(smiley)
            }
            
            return smileys
        }
        
        return Array()
    }
}