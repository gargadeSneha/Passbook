//
//  AddCredit.swift
//  PassBook
//
//  Created by TryCatch Classes on 01/12/22.
//

import UIKit

class AddCredit: UIViewController {

    @IBOutlet weak var date_lbl: UILabel!
    @IBOutlet weak var date_Btn: UIButton!
    @IBOutlet weak var category_lbl: UILabel!
    @IBOutlet weak var category_Btn: UIButton!
    @IBOutlet weak var amount_lbl: UILabel!
    @IBOutlet weak var amount_txtField: UITextField!
    @IBOutlet weak var type_lbl: UILabel!
    
    @IBOutlet weak var imgPicker1: UIImageView!
    @IBOutlet weak var imgPicker2: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    @IBOutlet weak var radio_Btn: UIButton!
    
 
        override func viewDidLoad() {
        super.viewDidLoad()
            
    
        category_Btn.layer.cornerRadius = 5
        imgPicker1.layer.cornerRadius = 10
        imgPicker2.layer.cornerRadius = 10
     
        datePicker.isHidden = true
                    
               
        
    }
    
    @IBAction func datePickerBtnTapped(_ sender: UIButton) {
        
    
    }
 
    
    @IBAction func CashRadioBtnTapped(_ sender: UIButton) {
        radio_Btn.addTarget(self, action: #selector(radioTapped(_:)), for: .touchUpInside)
    }
    @objc func radioTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
      
        
    }
    
