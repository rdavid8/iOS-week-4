//
//  AddRepoController.swift
//  GoGoGithub
//
//  Created by Ryan David on 2/24/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class AddRepoController: UIViewController
{
    
    
    @IBOutlet weak var textField: UITextField!
    @IBAction func cancelButton(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func saveRepoButton(sender: AnyObject) {
        API.shared.enqueue(POSTRepositoriesRequest(name:textField.text!)) { (success, json) -> () in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
