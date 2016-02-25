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
    var oauthViewController: OAuthViewController?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        self.checkOAuthStatus()
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool
    {
        GithubOAuth.shared.tokenRequestWithCallbackURL(url, options: SaveOptions.UserDefaults) { (success) -> () in
            if success {
                guard let oauthViewController = self.oauthViewController else { return }
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    oauthViewController.view.alpha = 0.0
                    }, completion: { (finished) -> Void in
                        oauthViewController.view.removeFromSuperview()
                        oauthViewController.removeFromParentViewController()
                })
            }
            
        }
        return true
    }

    func checkOAuthStatus()
    {
        do {
            let token = try GithubOAuth.shared.accessToken()
            print(token)
        } catch _ { self.presentOAuthViewController() }
    }
    
    func presentOAuthViewController()
    {
        guard let homeViewController = self.window?.rootViewController as? UITabBarController else { fatalError("root view controller changes") }
        guard let storyboard = homeViewController.storyboard else { fatalError("How is it that this view controller does not have storyboard?") }
        guard let oauthViewController = storyboard.instantiateViewControllerWithIdentifier(OAuthViewController.id()) as? OAuthViewController else { fatalError("Wrong View controller. Fix this please") }
        //view controllers property. grab first one from vc as home view and present
        homeViewController.addChildViewController(oauthViewController)
        homeViewController.view.addSubview(oauthViewController.view)
        
        oauthViewController.didMoveToParentViewController(homeViewController)
        
        self.oauthViewController = oauthViewController
    }
    
    
}

