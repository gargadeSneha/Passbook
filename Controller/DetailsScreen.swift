//
//  DetailsScreen.swift
//  PassBook
//
//  Created by TryCatch on 03/12/22.
//

import UIKit

class DetailsScreen: UIViewController {
    
    // UI Components
    @IBOutlet weak var imagecircle: UIView!
    @IBOutlet weak var forward_img: UIImageView!
    @IBOutlet weak var forward_name: UILabel!
    @IBOutlet weak var total_bills: UILabel!
    @IBOutlet weak var forward_date: UILabel!
    @IBOutlet weak var forward_amount: UILabel!
    @IBOutlet weak var forward_type: UILabel!
    @IBOutlet weak var transaction_table: UITableView!
    @IBOutlet weak var demo_imgpicker: UIImageView!
    
    //tableview array
    var array2 = [1,2,3]
    var track = ["Earlier", "On Time", "Delay"]
    
    //passing data
    var date = " "
    var amount = " "
    var type = " "
    var person_name = " "
    var profile_image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forward_date.text = date
        forward_name.text = person_name
        forward_amount.text = amount
        forward_type.text = type
        forward_img.image = profile_image
        
        
        //Registering XIB TableViewCell
        transaction_table.register(UINib(nibName: "TransactionTVC", bundle: .main), forCellReuseIdentifier: "TransactionTVC")
        transaction_table.delegate = self
        transaction_table.dataSource = self
        transaction_table.separatorStyle = .none
        
        self.navigationController?.isNavigationBarHidden = true
    
        // UIComponents properties
        demo_imgpicker.layer.cornerRadius = 5
        imagecircle.layer.cornerRadius = 30
        imagecircle.layer.borderWidth = 0.5
        imagecircle.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func go_back(_ sender: UIButton) {
        performSegue(withIdentifier: "back_Unwind", sender: self)
    }
}

//MARK: - TableView
extension DetailsScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return array2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTVC") as! TransactionTVC
        cell.member_name.text = person_name
        cell.amount.text = amount
        cell.pay_type.text = track[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
