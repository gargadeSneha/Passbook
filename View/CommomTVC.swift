//
//  CommomTVC.swift
//  PassBook
//
//  Created by TryCatch on 01/12/22.
//

import UIKit

class CommomTVC: UITableViewCell {

    weak var delegate: (TableViewCellDelegate)?
    
    //cell components
    @IBOutlet weak var imagecircle: UIView!
    @IBOutlet weak var cell_img: UIImageView!
    @IBOutlet weak var member_name: UILabel!
    @IBOutlet weak var pay_type: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //image circleview properties
        imagecircle.layer.cornerRadius = 26
        imagecircle.layer.borderWidth = 0.5
        imagecircle.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

protocol TableViewCellDelegate: HistoryScreen {
    func userDidTap()
}
