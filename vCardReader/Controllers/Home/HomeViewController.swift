//
//  HomeViewController.swift
//  vCardReader
//
//  Created by Pawan Kumar on 24/07/16.
//  Copyright © 2016 Pawan Kumar. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoadSetps(sender: AnyObject) {
        
        let storyboard = UIStoryboard.mainStoryboard()
        let viewController: StepsViewController = storyboard.instantiateViewControllerWithIdentifier("StepsViewController") as! StepsViewController
          self.navigationController!.presentViewController(viewController, animated: true, completion: nil)

    }
 
}
