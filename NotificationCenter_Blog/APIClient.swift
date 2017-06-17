//
//  APIClient.swift
//  NotificationCenter_Blog
//
//  Created by Erica Millado on 11/25/16.
//  Copyright © 2016 Erica Millado. All rights reserved.
//

import Foundation

class APIClient {
    
    class func getAPIdata( completion:@escaping (URL)-> Void) {
        
        let urlString = "https://pixabay.com/api/?key=\(Secrets.key)&q=aquatic+ocean&image_type=photo&pretty=true"
        
        let url = URL(string: urlString)
        
        guard let unwrappedUrl = url else { return }
        
        let session = URLSession.shared
        
        let datatask = session.dataTask(with: unwrappedUrl) { (data, response, error) in
            guard let unwrappedData = data else { return }
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! json
                let hitsArray = responseJSON["hits"] as! [json]
                let randomDict = Int(arc4random_uniform(UInt32(hitsArray.count)))
                let firstDict = hitsArray[randomDict] 
                let webImageString = firstDict["webformatURL"] as! String
                let imageURL:URL = URL(string: webImageString)!
                completion(imageURL)
            } catch {
                print("catch - getAPIdata()")
            }
        }
        datatask.resume()
    }
    
}




























