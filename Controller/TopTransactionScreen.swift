//
//  TopTransactionScreen.swift
//  PassBook
//
//  Created by TryCatch Classes on 01/12/22.
//

import UIKit

class TopTransactionScreen: UIViewController {

    ////Embedded UIViews
    @IBOutlet weak var greenGraph: LastCircleGraphView!
    @IBOutlet weak var blueGraph: CircleGraphView!
    @IBOutlet weak var redGraph: CircleGraphView!
    @IBOutlet weak var DownView3: HistoryView!
    
    // UI components
    @IBOutlet weak var transactionsrc_segment: UISegmentedControl!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var TransactionTable: UITableView!
    
    //Tableview Arrays
    var categoriesType = ["Cash","Cheque","Online Payment","Cash"]
    
    // Table Sections
    var sections = ["24 Oct", "20 Oct", "19 Oct"]
    
    var type_image = ["shopping-cart","Travel","tax","salary","investment","Health & Fitness","giftbox","food","bonus","bill"]
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var dataArr = [Useritem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Registering XIB TableViewCell
        TransactionTable.register(UINib(nibName: "CommomTVC", bundle: .main), forCellReuseIdentifier: "CommomTVC")
        TransactionTable.delegate = self
        TransactionTable.dataSource = self
        TransactionTable.separatorStyle = .none
        TransactionTable.sectionHeaderTopPadding = 5
        
        self.navigationController?.isNavigationBarHidden = true
        
        //CircleGraph Display Objects
        let backgroundTrackColor = UIColor(rgb: 0xDBECF8)
        greenGraph.arcBackgroundColor = backgroundTrackColor
        greenGraph.endArc = 0.5
        greenGraph.arcWidth = 8.0   //line width broadness
       
        redGraph.endArc = 0.5
        redGraph.arcColor = UIColor(rgb: 0xFF0000)
        redGraph.arcWidth = 8.0
        redGraph.arcBackgroundColor = backgroundTrackColor
        
        blueGraph.arcWidth = 8.0
        blueGraph.arcColor = UIColor(rgb: 0x4A90E2)
        blueGraph.endArc = 0.5
        blueGraph.arcBackgroundColor = backgroundTrackColor
        
        getdata()
 
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //Registering corners for embedded Views
        DownView3.roundCorners(corners: [.topLeft, .topRight], radius: 30)
    }
    
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        //Reloading different cells on view
        TransactionTable.reloadData()
    }
    
    @IBAction func topTransactionBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getdata() {
        let context = appdelegate.persistentContainer.viewContext
        
        do
        {
            dataArr = try context.fetch(Useritem.fetchRequest()) as! [Useritem]
            print("Count ->", dataArr.count)
            TransactionTable.reloadData()
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

//MARK: - TableView
extension TopTransactionScreen: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        if transactionsrc_segment.selectedSegmentIndex == 0 {
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
        if transactionsrc_segment.selectedSegmentIndex == 0 {
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

