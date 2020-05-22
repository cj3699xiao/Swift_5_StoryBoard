//
//  Multi-touch_View.swift
//  Final_Project_Yuchen_Xiao
//
//  Created by yuchen xiao on 3/16/20.
//  Copyright © 2020 yuchen xiao. All rights reserved.
//

import UIKit

class Multi_touch_View: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    var points : [CGPoint] = []
    var message : String = "Multi-Touch view"
    var tapMessage : String = ""
    
    var double_taped : Bool = false;
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
//        message.draw(at: CGPoint(x: 100, y: 100), withAttributes: nil)
        tapMessage.draw(at: CGPoint(x: 100, y: 200), withAttributes: nil)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(UIColor.red.cgColor)
            let r: CGFloat = 15
            for p in points {
                let rect = CGRect(x: p.x - r, y: p.y - r, width: 2 * r, height: 2 * r)
                context.fill(rect)
            }
        }
        
        if(double_taped == true){
            if let context = UIGraphicsGetCurrentContext() {
                context.setLineWidth(4)
                context.setStrokeColor(UIColor.black.cgColor)
                context.move(to: CGPoint(x: 200, y: 350))
                context.addLine(to: CGPoint(x: 200, y: 450))
                context.strokePath()
                
                context.move(to: CGPoint(x: 150, y: 360))
                context.addLine(to: CGPoint(x: 250, y: 360))
                context.strokePath()
                
                context.move(to: CGPoint(x: 200, y: 450))
                context.addLine(to: CGPoint(x: 250, y: 500))
                context.strokePath()
                
                context.move(to: CGPoint(x: 200, y: 450))
                context.addLine(to: CGPoint(x: 150, y: 500))
                context.strokePath()
                
                let circle = CGRect(x: 175, y: 300, width: 50, height: 50)
                context.setFillColor(UIColor.black.cgColor)
                context.fillEllipse(in: circle)
                
                let textAttr_Mr : [NSAttributedString.Key : Any] = [
                    .foregroundColor : UIColor.purple,
                    .font : UIFont(name: "Menlo", size: 12)!
                ]
                let text_conclusion = "Mr.Double Tapped!"
                text_conclusion.draw(at: CGPoint(x: 150, y: 550), withAttributes: textAttr_Mr)
                
            }
            
        }
    }
    
    var timer: Timer?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouches("touchBegan", touches: touches)
        tapMessage = ""
        if let touch = touches.first {
            if touch.tapCount >= 2 {
                timer?.invalidate()
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouches("touchMoved", touches: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouches("touchEnded", touches: touches)
        if let touch = touches.first {
            if touch.tapCount == 2 {
                handleDoubleTap()
            } else {
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
                    _ in self.handleSingleTap()
                }
            }
        }
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
            _ in self.clearTouches()
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouches("touchCancelled", touches: touches)
    }
    
    func handleTouches(_ method: String, touches: Set<UITouch>) {
        message = method + "[\(touches.count)]:"
        points.removeAll(keepingCapacity: true)
        for touch in touches {
            let p = touch.location(in: self)
            message += String(format: " (%.2f, %.2f)", p.x, p.y)
            points.append(p)
        }
        setNeedsDisplay()
    }
    
    func handleSingleTap() {
        tapMessage = "Your tapped once in 1 second!"
        setNeedsDisplay()
    }
    
    func handleDoubleTap() {
        tapMessage = "Your tapped twice in 1 second!"
        double_taped = true
        setNeedsDisplay()
    }
    
    func clearTouches() {
        message = ""
        tapMessage = ""
        double_taped = false;
        points.removeAll(keepingCapacity: true)
        setNeedsDisplay()
    }
    
    
}
