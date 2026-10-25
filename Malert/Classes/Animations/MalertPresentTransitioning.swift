//
//  MalertAnimatedTransitioning.swift
//  Pods
//
//  Created by Vitor Mesquita on 01/03/17.
//
//

import UIKit

class MalertPresentTransitioning: BaseTransitioning, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) as? Malert else {return}

        // Fill the container rather than UIScreen.main, which can be another display (e.g. iPhone Duo unfolded),
        // and keep filling it when the window resizes while the alert is shown
        toVC.view.frame = transitionContext.containerView.bounds
        toVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        transitionContext.containerView.addSubview(toVC.view)
        
        let malertView = toVC.malertView
        buildMalertAnimation(malertView: malertView, width: toVC.view.bounds.size.width, height: toVC.view.bounds.size.height)
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            malertView.alpha = 1
            malertView.transform = .identity
            toVC.view.backgroundColor = UIColor(white: 0, alpha: 0.4)
            
        }, completion: { (finished) in
            transitionContext.completeTransition(finished)
        })
    }
}
