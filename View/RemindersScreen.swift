//
//  RemindersScreen.swift
//  PassBook
//
//  Created by TryCatch on 05/12/22.
//

import UIKit

class RemindersScreen: UIViewController {

    @IBOutlet weak var likeBtn: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var Add_Btn: UIButton!
    
    
    struct Label {
        let header : String
        let text : [String]
    }
    
    
    var Sections = [Label]()
    var aaray = ["erty","erty","fgh"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        
        Add_Btn.layer.cornerRadius = 32
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        Sections.append(Label(header: "13 Nov", text: (["Take Rs. 5000 from Riya of Rent","Take Rs. 100 from Riya of Food"])))
        Sections.append(Label(header: "12 Nov", text: ["Take Rs. 50 from Riya of Recharge"]))
    }
    
    

    @IBAction func reminder_Back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func likrBtnTapped(_ sender: UIButton) {
        
        likeBtn.addTarget(self, action: #selector(likeTapped(_:)), for: .touchUpInside)
    }
    
    @objc func likeTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    
    
    

}
extension RemindersScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       /* if section == 0 {
            return 2
        }
        else if section == 1 {
            return 1
        }
        return 0*/
        return Sections[section].text.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RemindersCVC
        cell.cell_lbl.text = Sections[indexPath.section].text[indexPath.row]
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.layer.borderColor = CGColor(gray: 6, alpha: 7)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCell", for: indexPath) as! CollectionViewheader
        header.header_lbl.text = Sections[indexPath.section].header
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.width -  0 ) / 1 )
        let height = ((collectionView.frame.width -  40 ) / 3 )
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
  /*  func indexTitles(for collectionView: UICollectionView) -> [String]? {
        return header
   }*/
  
    
}
