//
//  SecondViewController.swift
//  NotificationCenter_Blog
//
//  Created by Yay It's Erica on 11/25/16.
//  Copyright © 2016 Yay It's Erica. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var youLikedItLabel: UILabel!
    
    @IBOutlet weak var secondOceanImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //2 - create an observer to "listen" to the posted notification. Once the notification is heard, unhide the label.
        NotificationCenter.default.addObserver(forName: Notification.Name("LikedItNotification"), object: nil, queue: nil) { (notification) in
            print("notification is \(notification)")
            self.youLikedItLabel.isHidden = false
            APIClient.getAPIdata { (webImageURL) in
                DispatchQueue.main.async {
                    guard let imageData = NSData(contentsOf: webImageURL) else { return }
                    let image = UIImage(data: imageData as Data)
                    self.secondOceanImage.image = image
                }
            }
        }
    }
    
    //3 - remove the observer after we're done with it, use deinit when the viewController gets deinitialized
    deinit {
        NotificationCenter.default.removeObserver(self)
    }


}

