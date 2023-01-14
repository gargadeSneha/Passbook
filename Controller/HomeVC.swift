//
//  HomeVC.swift
//  PassBook
//
//  Created by TryCatch Classes on 24/11/22.
//

import UIKit

class HomeVC: UIViewController {

    //HomeVC Components
    @IBOutlet weak var viewbanner: UIView!
    @IBOutlet weak var presentbtn: UIButton!
    @IBOutlet weak var HomeOptionsCV: UICollectionView!
    @IBOutlet weak var HistoryTable1: UITableView!
    
    //Embedded UIViews
    @IBOutlet weak var DownView: HistoryView!
    @IBOutlet weak var GraphDraw: GraphDraw!
    
    // Table Sections
    var sections = ["24 Oct", "20 Oct", "19 Oct"]
    
    //Home CollectionView Variables
    var options = ["Add","Top  Transactions", "Reminder"]
    
    //Segment Control
    @IBOutlet weak var homesegment: UISegmentedControl!
    
    //Tableview Arrays
    var categoriesType = ["Cash","Cheque","Online Payment","Cash"]
    var type_image = ["shopping-cart","Travel","tax","salary","investment","Health & Fitness","giftbox","food","bonus","bill"]

    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var dataArr = [Useritem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getdata()
        
        //Registering XIB TableViewCell
        HistoryTable1.register(UINib(nibName: "CommomTVC", bundle: .main), forCellReuseIdentifier: "CommomTVC")
        HistoryTable1.delegate = self
        HistoryTable1.dataSource = self
        HistoryTable1.separatorStyle = .none
        HistoryTable1.sectionHeaderTopPadding = 5
        
        //Collection View Methods
        HomeOptionsCV.delegate = self
        HomeOptionsCV.dataSource = self
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        // UIComponents properties
        viewbanner.layer.cornerRadius = 10
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //Registering corners for embedded Views
        DownView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
    }
    
    @IBAction func presentVC(_ sender: UIButton) {
        let historyscr = storyboard?.instantiateViewController(withIdentifier: "HistoryScreen") as! HistoryScreen
        self.navigationController?.present(historyscr, animated: true)
    }
    
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        //Reloading different cells on view
        HistoryTable1.reloadData()
    }
    
    func getdata() {
        let context = appdelegate.persistentContainer.viewContext
        
        do
        {
            dataArr = try context.fetch(Useritem.fetchRequest()) as! [Useritem]
            print("Count ->", dataArr.count)
            HistoryTable1.reloadData()
            for i in dataArr {
                print("Username :- \(i.name) , Date :- \(i.date), Amount :- \(i.amount)")
            }
        }
        catch
        {
           print("")
        }

    }
    
}

//MARK: - Collection View
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeOptionsCV.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OptionsCell
        cell.cell_img.image = UIImage(named: options[indexPath.row])
        cell.cell_lbl.text = options[indexPath.row]
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = ((collectionView.frame.width - 80) / 3)
        let height = ((collectionView.frame.height - 2) / 1)
        
        return CGSize(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc =  storyboard?.instantiateViewController(withIdentifier: "CreateNewScreen") as! CreateNewScreen
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if indexPath.row == 1 {
            let vc =  storyboard?.instantiateViewController(withIdentifier: "TopTransactionScreen") as! TopTransactionScreen
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if indexPath.row == 2 {
            let vc =  storyboard?.instantiateViewController(withIdentifier: "AddReminderScreen") as! AddReminderScreen
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}

//MARK: - TableView
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        if homesegment.selectedSegmentIndex == 0 {
            return dataArr.count
        } else {
            return dataArr.count
           }
        }
        else if section == 1{
            return dataArr.count
            }
        else {
            return dataArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if homesegment.selectedSegmentIndex == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommomTVC") as! CommomTVC
            let data = dataArr[indexPath.row]
            cell.member_name.text = data.name
            cell.amount.text = data.amount
            cell.pay_type.text = categoriesType[indexPath.row]
            cell.cell_img.image = UIImage(named: type_image[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommomTVC") as! CommomTVC
            let data = dataArr[indexPath.row]
            cell.member_name.text = data.name
            cell.amount.text = data.amount
            cell.pay_type.text = categoriesType[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
       }
    
}


