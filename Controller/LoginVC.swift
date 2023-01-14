//
//  LoginVC.swift
//  PassBook
//
//  Created by TryCatch Classes on 21/11/22.


import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginVC: UIViewController {

    //UI Components
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var useridTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        //btn Properties
        loginBtn.layer.borderWidth = 1.5
        loginBtn.layer.cornerRadius = 19
        
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        
        self.passwordTF.resignFirstResponder()
        self.useridTF.resignFirstResponder()
        
        //Firebase Authenticating user
        if let email = useridTF.text, let password = passwordTF.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                }
                else {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        
        self.passwordTF.resignFirstResponder()
        self.useridTF.resignFirstResponder()
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
