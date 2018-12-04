//
//  CustomPushAnimation.swift
//  Sion
//
//  Created by leimo on 2018/5/21.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit

class CustomPushAnimation: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    
    return 0.3
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    
    transitionContext.containerView.backgroundColor = UIColor.clear
    
    let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
    let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
    
    toViewController?.view.transform = CGAffineTransform(translationX: screenWidth, y: screenHeight)
    //通过以下方式,可以组合2个动画效果
    //      toViewController.view.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(-100, -100), CGAffineTransformMakeScale(2, 2))
    UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
//      toViewController?.view.transform =
//      toViewController?.view.transform = CGAffineTransformFromString("Identity")
      fromViewController?.view.transform = CGAffineTransform(translationX: -screenWidth, y: -screenHeight)
    }) { (completion) in
//      fromViewController?.view.transform = CGAffineTransformIdentity
//      fromViewController?.view.transform = CGAffineTransformFromString("Identity")
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
    
  }
  

}
