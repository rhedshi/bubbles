//
//  GameViewController.swift
//  Bubbles
//
//  Created by Rhed Shi on 12/20/14.
//  Copyright (c) 2014 Rhed Shi. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var bubble: Bubble?
    var score: Int = 0
    var tapGestureRecognizer = UITapGestureRecognizer()
    var timer = NSTimer()
    var startTime = NSTimeInterval()
    var timeLimit = NSTimeInterval(15.0 + 0.01)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.textColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        tapGestureRecognizer.addTarget(self, action: "createBubble")
        createBubble()
    }
    
    func createBubble() {
        if score == 1 {
            startTime = NSDate.timeIntervalSinceReferenceDate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "updateTime", userInfo: nil, repeats: true)
        }
        
        if bubble != nil {
            bubble!.removeFromSuperview()
        }
        
        bubble = Bubble(color: self.randomColor(), position: self.randomPoint())
        bubble!.addGestureRecognizer(self.tapGestureRecognizer)
        view.addSubview(self.bubble!)
        
        score++
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
    
    func randomPoint() -> CGPoint {
        var width: CGFloat = self.view.bounds.size.width
        var height: CGFloat = self.view.bounds.size.height
        var size: CGFloat = Bubble.size()
        return CGPointMake(CGFloat(drand48()) * (width - 2 * size) + size, CGFloat(drand48()) * (height - 2 * size) + size)
    }
    
    func updateTime() {
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        if elapsedTime > timeLimit {
            timer.invalidate()
            bubble!.removeGestureRecognizer(tapGestureRecognizer)
            
            var endViewController: EndViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("EndViewController") as EndViewController
            endViewController.updateScore(score)
            self.presentViewController(endViewController, animated: true, completion: nil)
        }
        else {
            let m = NSInteger(elapsedTime / 60.0)
            elapsedTime -= NSTimeInterval(m) * 60.0
            
            let s = NSInteger(elapsedTime)
            elapsedTime -= NSTimeInterval(s)
            
            let f = NSInteger(elapsedTime * 100)
            
            let minutes = m > 9 ? String(m):"0" + String(m)
            let seconds = s > 9 ? String(s):"0" + String(s)
            let fraction = f > 9 ? String(f):"0" + String(f)
            
            label.text = "\(minutes):\(seconds):\(fraction)"
        }
    }

}
