//
//  Bubble.swift
//  Bubbles
//
//  Created by Rhed Shi on 12/20/14.
//  Copyright (c) 2014 Rhed Shi. All rights reserved.
//

import UIKit

let width: CGFloat = 54.0

class Bubble: UIView {

    init(color: UIColor, position: CGPoint) {
        super.init(frame: CGRectMake(position.x, position.y, width, width))
        self.backgroundColor = color
        self.layer.cornerRadius = width / 2
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func size() -> CGFloat {
        return width
    }
    
    func pop(scale: CGFloat = 2.0, duration: NSTimeInterval = 0.25) {
        let w = scale * width
        let p = (scale - 1) / 2 * width
        let frame = CGRectMake(self.frame.origin.x - p, self.frame.origin.y - p, w, w)
        let radius = frame.width / 2
        
        UIView.animateWithDuration(duration, animations: {
            self.frame = frame
            self.alpha = 0
            }, completion: { finished in
            self.removeFromSuperview()
        })
        
        var animation: CABasicAnimation = CABasicAnimation(keyPath: "cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.fromValue = self.layer.cornerRadius
        animation.toValue = radius
        animation.duration = duration
        self.layer.cornerRadius = radius
        self.layer.addAnimation(animation, forKey: "cornerRadius")
    }

}
