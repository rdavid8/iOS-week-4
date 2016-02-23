//
//  AppDelegate.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/22/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool
    {
        GithubOAuth.shared.tokenRequestWithCallbackURL(url, options: SaveOptions.Keychain) { (success) -> () in
            if success {
             print("received Token!")
          
            
            }
        }
          return true
    }
    
}

