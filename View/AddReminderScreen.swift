//
//  AddReminderScreen.swift
//  PassBook
//
//  Created by TryCatch on 05/12/22.
//

import UIKit

class AddReminderScreen: UIViewController {

    @IBOutlet weak var date_Btn: UIButton!
    @IBOutlet weak var save_Btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        date_Btn.layer.cornerRadius = 5
        save_Btn.layer.cornerRadius = 20
        
        
    }
    
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func saveBtnTapped(_ sender: UIButton) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "RemindersScreen") as! RemindersScreen
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    

}
