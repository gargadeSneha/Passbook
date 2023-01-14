//
//  AddScreen.swift
//  PassBook
//
//  Created by TryCatch Classes on 01/12/22.
//

import UIKit

class AddScreen: UIViewController {

    @IBOutlet weak var XIBview: UIView!
    @IBOutlet weak var profile_img: UIImageView!
    @IBOutlet weak var addsrc_segment: SegmentControl!
    @IBOutlet weak var cashRadioBtn: UIButton!
    @IBOutlet weak var chequeRdioBtn: UIButton!
    @IBOutlet weak var onlineRadioBtn: UIButton!
    @IBOutlet weak var transparentView: UIView!
    @IBOutlet weak var datePickerBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var categoriesBtn: UIButton!
    
    
    @IBOutlet weak var amount_txtField: UITextField!
    @IBOutlet weak var number_lbl: UILabel!
    @IBOutlet weak var name_lbl: UILabel!
    
    var name = ""
    var no = ""
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var dataArr = [Useritem]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name_lbl.text = name
        number_lbl.text = no

        self.navigationController?.isNavigationBarHidden = true
        profile_img.layer.cornerRadius = 30
        datePickerBtn.layer.cornerRadius = 5
        categoriesBtn.layer.cornerRadius = 5
        
        
        profile_img.layer.borderWidth = 10
        profile_img.layer.borderColor = CGColor(gray: 9, alpha: 2)
        
        datePicker.date = Date()
        datePicker.locale = .current
        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
     
       
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.roundCorners(corners: [.topLeft, .topRight], radius: 30)
    }
    
    
    
    @IBAction func addBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        savedata()
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func cashRadioBtn(_ sender: UIButton) {
      
        if cashRadioBtn.tag == 0
        {
            cashRadioBtn.setImage(UIImage(named: "Radio button empty"), for: .normal)
            cashRadioBtn.tag = 1
        }
        else
        {
            cashRadioBtn.setImage(UIImage(systemName:  "record.circle"), for: .normal)
            cashRadioBtn.tag = 0
        }
        
    }
    
    @IBAction func chequeRadioBtn(_ sender: UIButton) {
        if chequeRdioBtn.tag == 0
        {
            chequeRdioBtn.setImage(UIImage(named: "Radio button empty"), for: .normal)
            chequeRdioBtn.tag = 1
        }
        else
        {
            chequeRdioBtn.setImage(UIImage(systemName:  "record.circle"), for: .normal)
            chequeRdioBtn.tag = 0
        }
    }
    
    @IBAction func onlinePaymentBtn(_ sender: UIButton) {
        if onlineRadioBtn.tag == 0
        {
            onlineRadioBtn.setImage(UIImage(named: "Radio button empty"), for: .normal)
            onlineRadioBtn.tag = 1
        }
        else
        {
            onlineRadioBtn.setImage(UIImage(systemName:  "record.circle"), for: .normal)
            onlineRadioBtn.tag = 0
        }
    }
    
    
    @IBAction func datePickerBtnTapped(_ sender: UIButton) {
        transparentView.isHidden = false
    }
    
    
    
    @IBAction func doneBtnTapped(_ sender: UIButton) {
        transparentView.isHidden = true
       // datePickerBtn.titleLabel = datePicker.date
    }
    
    @objc func dateSelected() {
       // print(datePicker.date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM"

        datePickerBtn.setTitle(dateFormatter.string(from: datePicker.date), for: .normal)
    }
    
    func savedata()
    {
        guard let amount = amount_txtField.text else {
            print("Name is not proper")
            return
        }
        
        let context = appdelegate.persistentContainer.viewContext
        let details = Useritem(context: context)
        
        details.name = name_lbl.text
        details.date = Date()
        details.amount = amount
        appdelegate.saveContext()
        amount_txtField.text = ""
        
    }
    
    
}
