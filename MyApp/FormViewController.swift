//
//  FormViewController.swift
//  MyApp
//
//  Created by teeramet kanchanapiroj on 11/30/2560 BE.
//  Copyright © 2560 teeramet kanchanapiroj. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var labelSlider: UILabel!
    @IBOutlet weak var tvName: UITextField!
    @IBOutlet weak var tvAddress: UITextField!
    @IBOutlet weak var tvEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func onSlider(_ sender: UISlider) {
        labelSlider.text = String(Int(sender.value))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ShowDataViewController{
        
            let name = tvName.text!
            let address = tvAddress.text!
            let email = tvEmail.text!
            let age = Int(labelSlider.text!)
            
            vc.data = UserModel(id: 1,name:name,age :age!)
        }
    }

}
