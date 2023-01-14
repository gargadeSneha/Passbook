//
//  SegmentControl.swift
//  PassBook
//
//  Created by TryCatch Classes on 29/11/22.
//

import UIKit

class SegmentControl: UISegmentedControl {
    
    private(set) lazy var radius:CGFloat = bounds.height / 2
    let color = UIColor(rgb: 0xEC4D34)
    let color1 = UIColor(rgb: 0x777777)
       
       // Configure selected segment inset, can't be zero or size will error when click segment
       private var segmentInset: CGFloat = 0.1{
           didSet{
               if segmentInset == 0{
                   segmentInset = 0.1
               }
           }
       }
       
       override init(items: [Any]?) {
           super.init(items: items)
           selectedSegmentIndex = 0
       }
       
       required init?(coder: NSCoder) {
       //fatalError("init(coder:) has not been implemented")
           super.init(coder: coder)
       }
       
       override func layoutSubviews(){
           super.layoutSubviews()
           self.backgroundColor = color1
           
           //MARK: - Configure Background Radius
           self.layer.cornerRadius = self.radius
           self.layer.masksToBounds = true

           //MARK: - Find selectedImageView
           let selectedImageViewIndex = numberOfSegments
           if let selectedImageView = subviews[selectedImageViewIndex] as? UIImageView
           {
               //MARK: - Configure selectedImageView Color
               selectedImageView.backgroundColor = color
               selectedImageView.image = nil
               
               //MARK: - Configure selectedImageView Inset with SegmentControl
               selectedImageView.bounds = selectedImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
               
               //MARK: - Configure selectedImageView cornerRadius
               selectedImageView.layer.masksToBounds = true
               selectedImageView.layer.cornerRadius = self.radius
               
               selectedImageView.layer.removeAnimation(forKey: "SelectionBounds")

           }
           
           //Set Segment Title Colors
           let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
               self.setTitleTextAttributes(titleTextAttributes, for: .normal)
           
           let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.black]
               self.setTitleTextAttributes(titleTextAttributes1, for: .selected)
       }
   }

//extension for using customized colors
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
