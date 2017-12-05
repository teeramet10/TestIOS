//
//  TableViewController.swift
//  MyApp
//
//  Created by teeramet kanchanapiroj on 11/20/2560 BE.
//  Copyright © 2560 teeramet kanchanapiroj. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var list = ["Yumi","Sutee","Bin"]
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
  
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.list.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController.init(title: "Name", message: list[indexPath.row], preferredStyle: .alert)
        
        let alertAction = UIAlertAction.init(title: "ok", style: .default, handler:{ alert ->  Void in
            let nameTextField = alertController.textFields![0] as UITextField
            
            if nameTextField.text != "" {
                let name = nameTextField.text! as String
                self.list[indexPath.row] = name
                self.tableView.reloadData()
                
            }
        })
        let alertCancelAction = UIAlertAction.init(title: "cancel", style: .default, handler: nil)
        alertController.addTextField(configurationHandler: {(textfield:UITextField)->Void in
            textfield.placeholder = "Input Name"
        })
        alertController.addAction(alertCancelAction)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onClickInsertItem(_ sender: Any) {
        addItem()
    }
    
    func addItem() ->Void{
        let alertControl = UIAlertController.init(title: "Data", message: "Insert Data", preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "Ok", style: .default, handler:{ alert ->Void in
            let textfielddata = alertControl.textFields![0] as UITextField
            let value = textfielddata.text! as String
            
            if value != "" {
            self.list.insert(value, at: self.list.endIndex)
            self.tableView.reloadData()
            }
        })
        
        alertControl.addAction(alertAction)
        alertControl.addTextField(configurationHandler: {(textfield :UITextField) -> Void in
                textfield.placeholder = "Input Name"
        })
        
        self.present(alertControl, animated: true, completion: nil)
    }

    override var prefersStatusBarHidden: Bool{
        return true
    }
}
