//
//  CircleGraphView.swift
//  circle view
//
//  Created by TryCatch on 02/12/22.
//

import UIKit

class CircleGraphView: UIView {
    var endArc:CGFloat = 0.0{   // in range of 0.0 to 1.0
            didSet{
                setNeedsDisplay()
            }
        }
    var arcWidth:CGFloat = 10.0
    var arcColor = UIColor(rgb: 0x00FF1A )
    var arcBackgroundColor =  UIColor(rgb: 0xDBECF8)
    
    override func draw(_ rect: CGRect) {
        
        //Important constants for circle
        let fullCircle = 1.1 * CGFloat(Double.pi)
        let start:CGFloat = -11.85 * fullCircle
        let end:CGFloat = endArc * fullCircle + start
        
        let start1:CGFloat = 0.0 * fullCircle
        let end1:CGFloat = endArc * fullCircle + start
        
        //find the centerpoint of the rect
        let centerPoint = CGPoint(x: rect.midX,y: rect.midY)
        
        //define the radius by the smallest side of the view
        var radius:CGFloat = 0.0
        if rect.width > rect.height{
            radius = (rect.width - arcWidth) / 2.5
        }else{
         radius = (rect.height - arcWidth) / 2.5
        }
        
        //starting point for all drawing code is getting the context.
        let context = UIGraphicsGetCurrentContext()
        
        //set line attributes
        context?.setLineWidth(arcWidth)
        context?.setLineCap(CGLineCap.round)
        
        //draw arc background color
        context?.setStrokeColor(arcBackgroundColor.cgColor)
        context?.addArc(center: centerPoint, radius: radius, startAngle: start1, endAngle: end1, clockwise: true)
        context?.strokePath()
        
        //draw the arc
        context?.setStrokeColor(arcColor.cgColor)
        context?.setLineWidth(arcWidth * 0.99)
        context?.addArc(center: centerPoint, radius: radius, startAngle: start, endAngle: end, clockwise: true)
        context?.strokePath()

    }
}


