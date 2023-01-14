//
//  TrackDraw.swift
//  PassBook
//
//  Created by TryCatch on 03/12/22.
//

import UIKit

class TrackDraw: UIView {

    override func draw(_ rect: CGRect) {

            //Line graph
            if let context = UIGraphicsGetCurrentContext() {
                if let context1 = UIGraphicsGetCurrentContext(){
                context.setStrokeColor(UIColor.green.cgColor)
                context.setLineWidth(3.0)
                context.move(to: CGPoint(x: 15, y: 23))                 //1st point
                context.addLine(to: CGPoint(x: 15, y: 65))              // 1st line
                context.strokePath()
                
                context1.setStrokeColor(UIColor.white.cgColor)
                context1.setLineWidth(3.0)
                context1.move(to: CGPoint(x: 15, y: 83))                 //2nd point
                context1.addLine(to: CGPoint(x: 15, y: 125))              //2nd line
                context1.strokePath()
                
                //To draw Circles
                var path = UIBezierPath()
                path.fill()
                
                //circle1
                let dot1 = CGRect(x: 5, y: 5,width: 18, height: 18)
                path = UIBezierPath(ovalIn: dot1)
                UIColor.green.setStroke()
                UIColor.systemGreen.setFill()
                path.lineWidth = 3.0
                path.stroke()
                path.fill()
                
                //circle2
                let dot2 = CGRect(x: 5, y: 65, width: 18, height: 18)
                path = UIBezierPath(ovalIn: dot2)
                UIColor.white.setStroke()
                path.lineWidth = 3.0
                path.stroke()
                
                //circle3
                let dot3 = CGRect(x: 5, y: 125, width: 18, height: 18)
                path = UIBezierPath(ovalIn: dot3)
                UIColor.white.setStroke()
                path.lineWidth = 3.0
                path.stroke()
          }
       }
   }
}
