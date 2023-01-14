//
//  SignUpVC.swift
//  PassBook
//
//  Created by TryCatch Classes on 21/11/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class SignUpVC: UIViewController {

    // UI Components
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var useridTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPassTF: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var move_to_login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Btn Properties
        signUpBtn.layer.cornerRadius = 19
        signUpBtn.layer.borderWidth = 1.5
        
    }

    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        
        self.passwordTF.resignFirstResponder()
        self.useridTF.resignFirstResponder()
        self.confirmPassTF.resignFirstResponder()
        
        
        //Firebase Registering user
        if let email = useridTF.text, let password = passwordTF.text {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
            }
            else {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
      }
   }
    
    @IBAction func MovetoLogin(_ sender: UIButton) {
        
        self.passwordTF.resignFirstResponder()
        self.useridTF.resignFirstResponder()
        self.confirmPassTF.resignFirstResponder()
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
