//
//  StepsViewController.swift
//  vCardReader
//
//  Created by Pawan Kumar on 24/07/16.
//  Copyright © 2016 Pawan Kumar. All rights reserved.
//

import UIKit
import RMStepsController

class StepsViewController: RMStepsController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stepsBar.hideCancelButton = false
        //self.showNextStep()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal override func stepViewControllers() -> [AnyObject]! {
    
        let firstStep: UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("SomeStep1")
        firstStep.step.title = "First"
        let secondStep: UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("SomeStep2")
        secondStep.step.title = "Second"
        let thirdStep: UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("SomeStep3")
        thirdStep.step.title = "Third"
        return [firstStep, secondStep, thirdStep]
    }
    
    override func finishedAllSteps() {
        self.dismissViewControllerAnimated(true, completion: { _ in })
        
    }
    
    override func canceled() {
        self.dismissViewControllerAnimated(true, completion: { _ in })
        
    }
}
