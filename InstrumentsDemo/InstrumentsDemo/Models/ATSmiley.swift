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
        if let sureData = data {
            var image = UIImage(data: data!)
            if let sureImage = image {
                return sureImage
            }
        }
        
        return UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("placeholder", ofType: "png")!)!
    }
    
    func getImage (completionCallback : (UIImage)-> ()) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
            let image = self.getImage()
            dispatch_async(dispatch_get_main_queue()){
                completionCallback(image)
                
            }
        }
    }
    
}