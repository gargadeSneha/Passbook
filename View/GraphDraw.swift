//
//  GraphDraw.swift
//  PassBook
//
//  Created by TryCatch on 25/11/22.
//

import UIKit

class GraphDraw: UIView {

    override func draw(_ rect: CGRect) {

            //Line graph
            if let context = UIGraphicsGetCurrentContext() {
                context.setStrokeColor(UIColor.systemGreen.cgColor)
                context.setLineWidth(0.9)
                context.move(to: CGPoint(x: 20, y: 210))                 //point
                context.addLine(to: CGPoint(x: 65, y: 180))              // 1st line
                context.addLine(to: CGPoint(x: 120, y: 192))             // 2nd line
                context.addLine(to: CGPoint(x: 170, y: 177))             // 3rd line
                context.addLine(to: CGPoint(x: 235, y: 146))             // 4th line
                context.addLine(to: CGPoint(x: 276, y: 98))              // 5th line
                context.addLine(to: CGPoint(x: 315, y: 67))              // 6th line
                context.addLine(to: CGPoint(x: 360, y: 44))              // 7th line
                context.strokePath()
                
                //Circles
                var path = UIBezierPath()
                path.fill()
                
                let dot1 = CGRect(x: 19, y: 200, width: 12, height: 12)
                path = UIBezierPath(ovalIn: dot1)
                UIColor.green.setFill()
                path.fill()
                
                let dot2 = CGRect(x: 131, y: 180, width: 12, height: 12)
                path = UIBezierPath(ovalIn: dot2)
                UIColor.green.setFill()
                path.fill()
                
                let dot3 = CGRect(x: 244, y: 124, width: 12, height: 12)
                path = UIBezierPath(ovalIn: dot3)
                UIColor.green.setFill()
                path.fill()
                
                let dot4 = CGRect(x: 356, y: 38, width: 12, height: 12)
                path = UIBezierPath(ovalIn: dot4)
                UIColor.green.setFill()
                path.fill()
            
                //Programmatical Labels
                let label = UILabel(frame: CGRect(x: 40, y: 200, width: 65, height: 25))
                label.font = UIFont(name: "AvenirNext-DemiBold" , size: 13.0)
                label.text = "₹27 - ₹350"
                label.textColor = .white
                self.addSubview(label)
                
                let label1 = UILabel(frame: CGRect(x: 151, y: 189, width: 65, height: 25))
                label1.font = UIFont(name: "AvenirNext-DemiBold" , size: 13.0)
                label1.text = "₹32 - ₹365"
                label1.textColor = .white
                self.addSubview(label1)
                
                let label3 = UILabel(frame: CGRect(x: 262, y: 131, width: 65, height: 25))
                label3.font = UIFont(name: "AvenirNext-DemiBold" , size: 13.0)
                label3.text = "₹33 - ₹390"
                label3.textColor = .white
                self.addSubview(label3)
                
                let label4 = UILabel(frame: CGRect(x: 315, y: 65, width: 65, height: 25))
                label4.font = UIFont(name: "AvenirNext-DemiBold" , size: 12.0)
                label4.text = "₹27 - ₹420"
                label4.textColor = .white
                self.addSubview(label4)
        }
    }
}

