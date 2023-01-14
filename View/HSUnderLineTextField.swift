//
//  HSUnderLineTextField.swift
//  PassBook
//
//  Created by TryCatch Classes on 01/09/1944 Saka.
//

import UIKit

class HSUnderLineTextField: UITextField,  UITextFieldDelegate {

    var click = false
    let border = CALayer()
    
    @IBInspectable open var lineColor : UIColor = UIColor.gray {
           didSet{
               border.borderColor = lineColor.cgColor
           }
       }

    @IBInspectable open var selectedLineColor : UIColor = UIColor.gray{
           didSet{
           }
       }

       @IBInspectable open var lineHeight : CGFloat = CGFloat(1.0) {
           didSet{
               border.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
           }
       }

       required init?(coder aDecoder: (NSCoder?)) {
           super.init(coder: aDecoder!)
           self.delegate=self;
           border.borderColor = lineColor.cgColor
           self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2])


           border.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
           border.borderWidth = lineHeight
           self.layer.addSublayer(border)
           self.layer.masksToBounds = true
       }

       override func draw(_ rect: CGRect) {
           border.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
       }

       override func awakeFromNib() {
           super.awakeFromNib()
           border.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
           self.delegate = self
       }

       func textFieldDidBeginEditing(_ textField: UITextField) {
           border.borderColor = selectedLineColor.cgColor
       }

       func textFieldDidEndEditing(_ textField: UITextField) {
           border.borderColor = lineColor.cgColor
       }
    
    
    //MARK:- UITextField Image part
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
            var textRect = super.leftViewRect(forBounds: bounds)
            textRect.origin.x += leftPadding
            return textRect
        }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x += rightPadding
        return textRect
    }
        
        @IBInspectable var leftImage: UIImage? {
            didSet {
                updateView()
            }
        }
        @IBInspectable var rightImage: UIImage? {
            didSet {
                updateView1()
            }
        }
    
        @IBInspectable var rightPadding: CGFloat = 0
        @IBInspectable var leftPadding: CGFloat = 0
        @IBInspectable var color: UIColor = UIColor.lightGray {
            didSet {
                updateView()
            }
        }
        
        func updateView() {
            if let image = leftImage {
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 22, height: 22))
                imageView.image = image
                let viewLeft: UIView = UIView(frame: CGRect(x: 30, y: 0, width: 28, height: 22))
                viewLeft.addSubview(imageView)
                imageView.contentMode = .scaleAspectFit
                leftViewMode = UITextField.ViewMode.always
        
                imageView.tintColor = color
                leftView = viewLeft
            }
            else {
                leftViewMode = UITextField.ViewMode.never
                leftView = nil
            }
            // Placeholder text color
            attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
        }
    
     func updateView1() {
        if let image = rightImage {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
            imageView.image = image
            let viewRight: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
            viewRight.addSubview(imageView)
            imageView.contentMode = .scaleAspectFit
            rightViewMode = UITextField.ViewMode.always
    
            imageView.tintColor = color
            rightView = viewRight
            
            let TGR = UITapGestureRecognizer(target: self, action: #selector(imgtap(TGR:)))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(TGR)
        }
        else {
            rightViewMode = UITextField.ViewMode.never
            rightView  = nil
        }
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    
    @objc func imgtap(TGR:UITapGestureRecognizer){
        let tap = TGR.view as! UIImageView
        
        if click == true {
            click = false
            
            tap.image = UIImage(systemName: "eye.fill")
            self.isSecureTextEntry = false
        }
        else{
            click = true
            tap.image = UIImage(systemName: "eye.slash.fill")
            self.isSecureTextEntry = true
        }
        
    }
    
}
