//
//  ViewController.swift
//  MyApp
//
//  Created by teeramet kanchanapiroj on 11/9/2560 BE.
//  Copyright © 2560 teeramet kanchanapiroj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var tvMessage: UILabel!
    @IBOutlet weak var btnPress: UIButton!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showMessage(_ sender: Any) {
        if count%2==0 {
            tvMessage.text="Hello World!"
        }else{
            tvMessage.text="Hello Mar!"
        }
        count+=1
    }
    @IBAction func showAlert(_ sender: Any) {
       showAlertDialog(message: "hi")
        
    }
    @IBAction func onClosePage(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showAlertDialog(message:String) -> Void {
        let alertControl = UIAlertController(title: "Title", message: message,preferredStyle:.alert)
        let alertOKAction = UIAlertAction(title: "OK", style: .default)
        {
            (action:UIAlertAction!) in print("")
            DispatchQueue.main.async{
                //self.dismiss(animated: true, completion: nil)
            }
        }
        alertControl.addAction(alertOKAction)
        self.present(alertControl, animated: true, completion: nil)    }
   
    @IBAction func onNextPage(_ sender: Any) {
        let tableViewController = self.storyboard?.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        self.present(tableViewController, animated: true)
    }
}

