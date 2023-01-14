//
//  CreateNewScreen.swift
//  PassBook
//
//  Created by TryCatch Classes on 02/12/22.
//

import UIKit

class CreateNewScreen: UIViewController {

    @IBOutlet weak var number_txtField: UITextField!
    @IBOutlet weak var name_txtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    

    @IBAction func createNewBackBtn(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

    @IBAction func AddBtnTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddScreen") as! AddScreen
        vc.name = name_txtField.text!
        vc.no = number_txtField.text!
        
        name_txtField.text = ""
        number_txtField.text = ""
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
