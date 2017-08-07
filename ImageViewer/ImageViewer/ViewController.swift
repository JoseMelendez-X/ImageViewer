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
        
    }
    
    
    //The 2 required tableView functions
    
    //How many rows should appear?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return pictures.count
        
    }
    
    //What Each row should look like
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Try loading the "Detail" view controller and typecasting it as DetailViewController
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            //Success, set it's selectedImage property
            
            vc.selectedImage = pictures[indexPath.row]
    
        
        //Now push it onto the navigation controller
        navigationController?.pushViewController(vc, animated: true)
            
        }
    }

}

