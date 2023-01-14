//
//  TransactionOptionDraw.swift
//  PassBook
//
//  Created by TryCatch on 03/12/22.
//

import UIKit

class TransactionOptionDraw: UIView {
    
    //customized colors
    let blue1 = UIColor(rgb: 0x4A90E2)
    let red1 = UIColor(rgb: 0xFF0000)
    let green1 = UIColor(rgb: 0x00FF1A)
    let label_color = UIColor(rgb: 0xA5A5A5)

    override func draw(_ rect: CGRect) {
    //Circles
    var path = UIBezierPath()
    path.fill()
    
    let dot1 = CGRect(x: 40, y: 10, width: 8, height: 8)
    path = UIBezierPath(ovalIn: dot1)
    blue1.setFill()
    path.fill()
    
    let dot2 = CGRect(x: 155, y: 10, width: 8, height: 8)
    path = UIBezierPath(ovalIn: dot2)
    red1.setFill()
    path.fill()
    
    let dot3 = CGRect(x: 270, y: 10, width: 8, height: 8)
    path = UIBezierPath(ovalIn: dot3)
    green1.setFill()
    path.fill()
    
    //Programmatical labels
    let label = UILabel(frame: CGRect(x: 55, y: 2, width: 40, height: 25))
    label.font = UIFont(name: "AvenirNext-DemiBold" , size: 13.0)
    label.text = "Bonus"
    label.textColor = label_color
    self.addSubview(label)
    
    let label1 = UILabel(frame: CGRect(x: 170, y: 2, width: 40, height: 25))
    label1.font = UIFont(name: "AvenirNext-DemiBold" , size: 13.0)
    label1.text = "Salary"
    label1.textColor = label_color
    self.addSubview(label1)
    
    let label3 = UILabel(frame: CGRect(x: 285, y: 2, width: 45, height: 25))
    label3.font = UIFont(name: "AvenirNext-DemiBold" , size: 13.0)
    label3.text = "Food &"
    label3.textColor = label_color
    self.addSubview(label3)
        
    let label4 = UILabel(frame: CGRect(x: 285, y: 20, width: 45, height: 25))
    label4.font = UIFont(name: "AvenirNext-DemiBold" , size: 13.0)
    label4.text = "Dining"
    label4.textColor = label_color
    self.addSubview(label4)
        
    }
}


