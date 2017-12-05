//
//  LoginController.swift
//  MyApp
//
//  Created by teeramet kanchanapiroj on 11/9/2560 BE.
//  Copyright © 2560 teeramet kanchanapiroj. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogin(_ sender: Any) {
        /*let presentMessageController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
         
         self.present(presentMessageController,animated:true)*/
        let user = usernameTextfield.text
        let pass = passwordTextfield.text
        login(user:user!,pass:pass!)
    }
    
    func login(user:String,pass:String)-> Void{
        
        let myurl = URL(string:"http://164.115.27.232:9981/api/Login/\(user)/\(pass)")
        var request = URLRequest(url:myurl!)
        request.httpMethod = "GET"
        request.timeoutInterval = 15
        
        
        let task = URLSession.shared.dataTask(with: myurl!) {(data, response, error) in
            if let err = error {
                print(err)
            }else{
                if let content = data {
                    do{
                        let json = try JSONSerialization.jsonObject(with: content , options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        let success = json["success"] as! Int
                        DispatchQueue.main.async {
                            if success == 1 {
                                
                                let presentMessageController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                                
                                self.present(presentMessageController,animated:true)
                                
                                
                            }else{
                                self.showAlertDialog(message: "Wrong pass")
                            }
                        }
                        /*print(json)
                         print(json["success"])*/
                    }catch{
                        print("json error")
                    }
                }
            }
            }
            task.resume()
        
        
    }
    
    func onNextPage() ->Void{
        let presentMessageController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.present(presentMessageController,animated:true)
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
}
