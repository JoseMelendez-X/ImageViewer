//
//  ViewController.swift
//  ImageViewer
//
//  Created by Jose Melendez on 8/6/17.
//  Copyright © 2017 JoseMelendez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    //Array of pictures
    
    var pictures = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create a File Manager object. The File Manager is used to create, copy, and move files and directories
        
        let fm = FileManager.default
        
        //The location of where you can find the Images
        
        let path = Bundle.main.resourcePath!
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            
            if item.hasPrefix("nssl") {
                
                //append the image to the array of pictures
                
                pictures.append(item)
                
            }
        }
        
     print(pictures)
        
    }
}

