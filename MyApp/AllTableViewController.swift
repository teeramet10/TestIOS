//
//  AllTableViewController.swift
//  MyApp
//
//  Created by teeramet kanchanapiroj on 12/12/2560 BE.
//  Copyright © 2560 teeramet kanchanapiroj. All rights reserved.
//

import UIKit

class AllTableViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var customSegment: CustomSegmentUIView!
    
    @IBOutlet weak var tableview: UITableView!
    var all = ["Photographer","Technology","Home","Beauty"]
    var favorite = ["Cosmetic","Series"]
    var me = ["Korea serie","USA Serie","Anime","Movie","Manga"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var num = 0
        
        switch customSegment.selectedSegmentIndex {
        case 0:
            num = all.count
            break
        case 1:
            num = favorite.count
            break
        case 2:
            num = me.count
            break
        
        default:
            break
        }
        return num
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var namecell = "cell"
        if customSegment.selectedSegmentIndex == 1 {
            namecell = "cell2"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: namecell, for: indexPath)
        
        cell.textLabel!.text = getData(row: indexPath.row)
        return cell
    }
    
    func getData(row : Int)->String{
        
        var data = ""
        
        switch customSegment.selectedSegmentIndex {
        case 0:
            data = all[row]
            break
        case 1:
            data = favorite[row]
            break
        case 2:
            data = me[row]
            break
        default:
            break
        }
        return data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentChange(_ sender: Any) {
        
        tableview.reloadData()
    }
    


    @IBAction func customSegmentChange(_ sender: Any) {
        tableview.reloadData()
    }
    

}
