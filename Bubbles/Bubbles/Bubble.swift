//
//  Bubble.swift
//  Bubbles
//
//  Created by Rhed Shi on 12/20/14.
//  Copyright (c) 2014 Rhed Shi. All rights reserved.
//

import UIKit

let length: CGFloat = 54.0

class Bubble: UIView {

    init(color: UIColor, position: CGPoint) {
        super.init(frame: CGRect(x: position.x, y: position.y, width: length, height: length))
        self.backgroundColor = color
        self.layer.cornerRadius = length / 2
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func size() -> CGFloat {
        return length
    }
    
    func pop(scale: CGFloat = 2.0, duration: NSTimeInterval = 0.25) {
        let s = scale * length
        let p = (scale - 1) / 2 * length
        let frame = CGRect(x: self.frame.origin.x - p, y: self.frame.origin.y - p, width: s, height: s)
        let radius = frame.width / 2
        
        UIView.animateWithDuration(duration, animations: {
            self.frame = frame
            self.alpha = 0
            }, completion: { finished in
            self.removeFromSuperview()
        })
        
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.fromValue = self.layer.cornerRadius
        animation.toValue = radius
        animation.duration = duration
        self.layer.cornerRadius = radius
        self.layer.addAnimation(animation, forKey: "cornerRadius")
    }

}
