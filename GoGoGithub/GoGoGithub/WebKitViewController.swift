//
//  WebKitViewController.swift
//  GoGoGithub
//
//  Created by Ryan David on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController, Identity {
    
    var username: String?
    var doneButtonBuffer : CGFloat = 50.0
    
    @IBAction func doneButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    var owner: Owner? {
        didSet{
            if let owner = owner {
                print(owner.name)
            }
        }
    }
    
    class func id() -> String {
        return "WebKitViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func webView(){
        if let owner = owner {
            let url = NSURL(string:owner.name)
            let request = NSMutableURLRequest(URL: url!)
            let frame = CGRect(x: 0.0, y: doneButtonBuffer, width: self.view.frame.width, height: self.view.frame.height-doneButtonBuffer)
            let webView = WKWebView(frame: frame)
            self.view.addSubview(webView)
            webView.loadRequest(request)
        }
    }
    
}