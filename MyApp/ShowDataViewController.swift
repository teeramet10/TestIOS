//
//  ShowDataViewController.swift
//  MyApp
//
//  Created by teeramet kanchanapiroj on 11/30/2560 BE.
//  Copyright © 2560 teeramet kanchanapiroj. All rights reserved.
//

import UIKit

class ShowDataViewController: UIViewController {

    var data : UserModel?
    
    @IBOutlet weak var tvName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        tvName.text = data!.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
