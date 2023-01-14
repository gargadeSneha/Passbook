//
//  HistoryView.swift
//  PassBook
//
//  Created by TryCatch Classes on 30/11/22.
//

import UIKit

class HistoryView: UIView {

        override func layoutSubviews() {
            super.layoutSubviews()
            // corners for embedded view
            roundCorners(corners: [.topLeft, .topRight], radius: 3.0)
        }
}
extension UIView {
    // corners for embedded view function
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
