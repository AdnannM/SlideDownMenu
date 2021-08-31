//
//  MenuTransitionManager.swift
//  SlideDownMenu
//
//  Created by Adnann Muratovic on 31.08.21.
//

import Foundation
import UIKit

@objc protocol MenuTransitiomManagerDelegate {
    func dismiss()
}

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    let duration = 0.5
    var isPresenting = false
    
    var snapshot: UIView? {
        didSet {
            if let delegate = delegate {
                let tapGesture = UIGestureRecognizer(target: delegate.self, action: #selector(delegate.dismiss))
                snapshot?.addGestureRecognizer(tapGesture)
            }
        }
    }
    
    var delegate: MenuTransitiomManagerDelegate?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // Get the reference fromView toView and containerView
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else {
            return
        }
        
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else {
            return
        }
        
        // Set up the transform well use in animation
        let container = transitionContext.containerView
        
        let moveDown = CGAffineTransform(translationX: 0, y: container.frame.height - 150)
        let moveUp = CGAffineTransform(translationX: 0, y: -50)
        
        // Add both view to the container
        if isPresenting {
            toView.transform = moveUp
            
            snapshot = fromView.snapshotView(afterScreenUpdates: true)
            
            container.addSubview(toView)
            container.addSubview(snapshot!)
        }
        
        // Perform Animation
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: []) {
            if self.isPresenting {
                self.snapshot?.transform = moveDown
                toView.transform = CGAffineTransform.identity
            } else {
                self.snapshot?.transform = CGAffineTransform.identity
                fromView.transform = moveUp
            }
        } completion: { finished in
            transitionContext.completeTransition(true)
            
            if !self.isPresenting {
                self.snapshot?.removeFromSuperview()
            }
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
}
