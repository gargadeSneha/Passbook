//
//  HistoryScreen.swift
//  PassBook
//
//  Created by TryCatch Classes on 30/11/22.
//

import UIKit
import CoreData

class HistoryScreen: UIViewController {
   
    //UI Components
    @IBOutlet weak var historysrc_segment: UISegmentedControl!
    @IBOutlet weak var DownView2: HistoryView!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var HistoryTable2: UITableView!
    
    // Table Sections
    var sections = ["24 Oct", "20 Oct", "19 Oct"]
    
    // tableView Arrays
    var categoriesType = ["Cash","Cheque","Online Payment","Cash"]
    var type_image = ["shopping-cart","Travel","tax","salary","investment","Health & Fitness","giftbox","food","bonus","bill"]
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var dataArr = [Useritem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Registering Xib TableViewCells
        HistoryTable2.register(UINib(nibName: "CommomTVC", bundle: .main), forCellReuseIdentifier: "CommomTVC")
        HistoryTable2.delegate = self
        HistoryTable2.dataSource = self
        HistoryTable2.separatorStyle = .none
        HistoryTable2.sectionHeaderTopPadding = 5
        
        getdata()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //Registering corners for embedded Views
        DownView2.roundCorners(corners: [.topLeft, .topRight], radius: 30)
    }
    
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        //Reloading different cells on view
        HistoryTable2.reloadData()
    }
    
    @IBAction func go_back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
    func getdata() {
        let context = appdelegate.persistentContainer.viewContext
        
        do
        {
            dataArr = try context.fetch(Useritem.fetchRequest()) as! [Useritem]
            
            print("Count ->", dataArr.count)
            HistoryTable2.reloadData()
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

extension HistoryScreen: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        if historysrc_segment.selectedSegmentIndex == 0 {
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
        if historysrc_segment.selectedSegmentIndex == 0 {
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
    
    //MARK: - Sir Doubt Yaha Hai
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ViewToDetails", sender: self)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = HistoryTable2.indexPathForSelectedRow
        let data = dataArr[indexPath!.row]
        let detailsVC = segue.destination as! DetailsScreen
        
        detailsVC.person_name = data.name!
        detailsVC.type =  categoriesType[indexPath!.row]
        detailsVC.amount = data.amount!
        detailsVC.profile_image = UIImage(named: type_image[indexPath!.row])!
        
        }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
       }
}



