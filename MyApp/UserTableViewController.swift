//
//  UserTableViewController.swift
//  MyApp
//
//  Created by teeramet kanchanapiroj on 12/5/2560 BE.
//  Copyright © 2560 teeramet kanchanapiroj. All rights reserved.
//

import UIKit

class UserTableViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var userList  : [UserModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (userList.count)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
        
        if let image = userList[indexPath.row].image {
            let url = URL(string : image)
            let data = try? Data.init(contentsOf: url!)
            if let imagedata = data {
            cell.imageUser.image = UIImage(data : imagedata)
            }
            }
        
        cell.tvNam.text = userList[indexPath.row].name
    
        return (cell)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user1  = UserModel(id:1,name:"yumi",age:16)
        user1.image = "https://i.pinimg.com/736x/65/47/84/65478466765ef4f1229394ec7381efc1--sailor-uranus-sailor-moon.jpg"
        
        let user2 = UserModel(id: 2, name: "nami", age: 22 )
        user2.image  = "https://assets.teenvogue.com/photos/583345d75e8102342c84bc41/master/pass/sailor-moon.jpg"
        
        userList.append(user1)
        userList.append(user2)
    
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    



}
