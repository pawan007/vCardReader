//
//  ContainerViewController.swift
//  vCardReader
//
//  Created by Pawan Kumar on 24/07/16.
//  Copyright © 2016 Pawan Kumar. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NextSetpTapped(sender: AnyObject) {
        self.stepsController.showNextStep()
    }
    
    @IBAction func PreviousSetpTapped(sender: AnyObject) {
        self.stepsController.showPreviousStep()
    }
}
