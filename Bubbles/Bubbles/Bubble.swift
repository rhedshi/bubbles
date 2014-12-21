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

}
