//
//  ATSmiley.swift
//  InstrumentsDemo
//
//  Created by Ashish Tyagi on 27/01/15.
//  Copyright (c) 2015 Ashish Tyagi. All rights reserved.
//

import UIKit

class ATSmiley {
   
    var name : String
    var imageUrl : String
    
    init (name: String, imageUrl: String) {
        self.name = name
        self.imageUrl = "\(imageUrl).png"
    }
    
    func getImage () -> UIImage {
        
        var data = NSData(contentsOfURL: NSURL(string: self.imageUrl)!)
        var image = UIImage(data: data!)
        return image!
    }
    
    
}
