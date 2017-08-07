//
//  DetailViewController.swift
//  ImageViewer
//
//  Created by Jose Melendez on 8/7/17.
//  Copyright © 2017 JoseMelendez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImage {
            
            imageView.image = UIImage(named: imageToLoad)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Hide navigation bar when screen is tapped
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Navigation bar won't be hidden when user click on another image
        navigationController?.hidesBarsOnTap = false
    }
    
  
}
