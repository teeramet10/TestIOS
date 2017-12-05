//
//  StoringDataViewController.swift
//  MyApp
//
//  Created by teeramet kanchanapiroj on 12/2/2560 BE.
//  Copyright © 2560 teeramet kanchanapiroj. All rights reserved.
//

import UIKit

class StoringDataViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addStroingData(_ sender: Any) {
       
       setHiddenUi(hidden: false)
    }
    
    func setHiddenUi(hidden : Bool){
        textFieldName.isHidden = hidden
        messageLabel.isHidden = hidden
    }
    func setStroingData(name :String){
        UserDefaults.standard.set(name, forKey: "NAME")
    
    }
    
    func getStroingData() -> String?{
        return UserDefaults.standard.string(forKey: "NAME")
    }
    
    @IBAction func showStroingData(_ sender: Any) {
        let data = getStroingData()
        
        if let value = data as String?{
        let alertController = UIAlertController.init(title: "What's your name?", message: value, preferredStyle: .alert)
        
        let action = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    
        }
    }
    
    @IBAction func saveStroingData(_ sender: Any) {
        if let data = textFieldName.text ,!data.isEmpty{
            setStroingData(name: data)
        }
        
        setHiddenUi(hidden: true)
    }
}
