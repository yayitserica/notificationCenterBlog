//
//  FirstViewController.swift
//  NotificationCenter_Blog
//
//  Created by Yay It's Erica on 11/25/16.
//  Copyright © 2016 Yay It's Erica. All rights reserved.
//

import UIKit

typealias json = [String:Any]

class FirstViewController: UIViewController {

    @IBOutlet weak var oceanImage: UIImageView!
    
    @IBAction func likeItTapped(_ sender: UIButton) {
        
        //1 - post a notification to the notification center
        NotificationCenter.default.post(name: Notification.Name("LikedItNotification"), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.getAPIdata { (webImageURL) in
            DispatchQueue.main.async {
                let imageData = NSData(contentsOf: webImageURL)
                let image = UIImage(data: imageData as! Data)
                self.oceanImage.image = image
            }
        }
    }

    
    
    

}

