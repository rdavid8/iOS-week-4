//
//  API.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/23/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

typealias APICompletionHandler = (success: Bool, json: [[String : AnyObject]]) -> ()

class API
{
    static let shared = API()
    private init() {}
    
    let session = NSURLSession.sharedSession()

    
    func enqueue(apiRequest: APIRequest, completion: APICompletionHandler)
    {
        let request = NSMutableURLRequest.requestWithAPIRequest(apiRequest)
        
        self.session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if error == nil {
                if let data = data {
                    do  {
                        if let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [[String : AnyObject]] {
                            completion(success: true, json: json)
//                            print(json)
                        }
                        if let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String : AnyObject] {
//                            print(json)
                        }
                    } catch _ {}
                }
            }
        }.resume()
    }
    
    class func getImage(urlString: String, completion: (image: UIImage) -> ()) {
        NSOperationQueue().addOperationWithBlock { () -> Void in
            guard let url = NSURL(string: urlString) else { return }
            guard let data = NSData(contentsOfURL: url) else { return }
            guard let image = UIImage(data: data) else { return }
            
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                completion(image: image)
            })
        
    }
}
}