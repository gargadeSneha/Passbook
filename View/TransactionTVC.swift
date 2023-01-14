//
//  CommomTVC.swift
//  PassBook
//
//  Created by TryCatch on 01/12/22.
//

import UIKit

class TransactionTVC: UITableViewCell {

    //cell components
    @IBOutlet weak var member_name: UILabel!
    @IBOutlet weak var pay_type: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
