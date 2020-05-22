//
//  Progress_View.swift
//  Final_Project_Yuchen_Xiao
//
//  Created by yuchen xiao on 3/16/20.
//  Copyright © 2020 yuchen xiao. All rights reserved.
//

import UIKit

class Progress_View: UIView {
    
    override func draw(_ rect: CGRect) {
        
        
        // Drawing an image
        //            if let image = UIImage(named: "Chicago") {
        //                let rect = CGRect(x: 20, y: 420, width: 150, height: 100)
        //                //image.draw(at: CGPoint(x: 20, y: 420))  // draw at full size
        //                image.draw(in: rect)
        //            }
        
        if(target_BMI == -1 || my_BMI == -1){
            
            
            let text =  "Please finished daily_test and plan_set!"
            let textAttr : [NSAttributedString.Key : Any] = [
                .foregroundColor : UIColor.blue,
                .font : UIFont(name: "Menlo", size: 12)!
            ]
            text.draw(at: CGPoint(x: 70, y: 220), withAttributes: textAttr)
            
        }else{
            let cur_height: Int = Int((my_BMI/target_BMI)*100)
            
            let text =  "User's Schedule"
            let textAttr : [NSAttributedString.Key : Any] = [
                .foregroundColor : UIColor.blue,
                .font : UIFont(name: "Menlo", size: 25)!
            ]
            text.draw(at: CGPoint(x: 110, y: 20), withAttributes: textAttr)
            
            if let context = UIGraphicsGetCurrentContext() {
                
                // Drawing coordinate
                context.setLineWidth(4)
                context.setStrokeColor(UIColor.black.cgColor)
                context.move(to: CGPoint(x: 50, y: 100))
                context.addLine(to: CGPoint(x: 50, y: 300))
                context.strokePath()
                
                context.setLineWidth(4)
                context.move(to: CGPoint(x: 50, y: 300))
                context.addLine(to: CGPoint(x: 300, y: 300))
                context.strokePath()
                
                context.setLineWidth(2)
                context.setStrokeColor(UIColor.green.cgColor)
                context.setFillColor(UIColor.green.cgColor)
                
                let rect_cur = CGRect(x: 100, y: 300, width: 50, height: cur_height * -1)
                context.fill(rect_cur)
                let rect_cur_l = CGRect(x: 250, y: 400, width: 50, height: 50)
                context.fill(rect_cur_l)
                
                
                context.setStrokeColor(UIColor.red.cgColor)
                context.setFillColor(UIColor.red.cgColor)
                
                let rect_tar = CGRect(x: 200, y: 300, width: 50, height: -100)
                context.fill(rect_tar)
                let rect_tar_l = CGRect(x: 250, y: 500, width: 50, height: 50)
                context.fill(rect_tar_l)
                
            }
            
            let text_cur =  "Current BMI"
            let textAttr_b : [NSAttributedString.Key : Any] = [
                .foregroundColor : UIColor.black,
                .font : UIFont(name: "Menlo", size: 25)!
            ]
            text_cur.draw(at: CGPoint(x: 70, y: 400), withAttributes: textAttr_b)
            
            let text_tar = "Target BMI"
            text_tar.draw(at: CGPoint(x: 70, y: 500), withAttributes: textAttr_b)
            
            
            let textAttr_c : [NSAttributedString.Key : Any] = [
                .foregroundColor : UIColor.black,
                .font : UIFont(name: "Menlo", size: 12)!
            ]
            let text_conclusion = "Current BMI is \(Int(my_BMI/target_BMI*100)) % of Target BMI"
            text_conclusion.draw(at: CGPoint(x: 70, y: 600), withAttributes: textAttr_c)
        }
        /*
         // Only override draw() if you perform custom drawing.
         // An empty implementation adversely affects performance during animation.
         override func draw(_ rect: CGRect) {
         // Drawing code
         }
         */
        
    }
}
