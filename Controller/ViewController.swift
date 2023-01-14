//
//  ViewController.swift
//  PassBook
//
//  Created by TryCatch Classes on 21/11/22.
//

import UIKit

class ViewController: UIViewController {

    //Logo image
    @IBOutlet weak var launch_logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        launch_logo.isHidden = true
        // Screen Timer
        do{
            sleep(3)
        }
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

