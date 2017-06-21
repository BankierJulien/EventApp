//
//  fadeInAndOutExtension.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/19/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//


import UIKit

extension UIView {
    
    func slideInFromRight(duration: TimeInterval = 0.5, completionDelegate: AnyObject? = nil) {
        // Create a CATransition animation
        let slideInFromRightTransition = CATransition()
        
        // Set its callback delegate to the completionDelegate that was provided (if any)
        if let delegate: AnyObject = completionDelegate {
            slideInFromRightTransition.delegate = delegate as? CAAnimationDelegate
        }
        // Customize the animation's properties
        slideInFromRightTransition.type = kCATransitionPush
        slideInFromRightTransition.subtype = kCATransitionFromRight
        slideInFromRightTransition.duration = duration
        slideInFromRightTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        slideInFromRightTransition.fillMode = kCAFillModeBoth
        
        // Add the animation to the View's layer
        self.layer.add(slideInFromRightTransition, forKey: "slideInFromRightTransition")
    }
}
