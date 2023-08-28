//
//  ViewController.swift
//  Text&EmailValidation
//
//  Created by Sainath Bamen on 26/07/23.
//

import UIKit
class UtilityFunction:NSObject{
    func simpleAlert(vc:ViewController, title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        vc.present(alert, animated: true, completion: nil)
        
        
    }
    
}


class ViewController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func button(_ sender: Any) {
        if let email = emailTxt.text, let password = passwordTxt.text{
            if email == "" && password == ""{
                UtilityFunction().simpleAlert(vc: self, title: "Alert", message: "Please Enter valid password or email address")
                
            }
            
            else{
                if !email.isValidEmail(email: emailTxt.text ?? ""){
                    UtilityFunction().simpleAlert(vc: self, title: "Alert!", message: "Please Enter Valid Email")
                    
                }else if !password.isValidPassword(password: passwordTxt.text ?? ""){
                    UtilityFunction().simpleAlert(vc: self, title: "Alert!", message: "Please Enter Valid Password")
                    
                }else{
                    
                }
                    
            }
            
            
        }
        
        
    }
        
    }
    
extension String{
    func isValidEmail(email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
    
    func isValidPassword(password: String) -> Bool{
        let passwordRegEx = "^(?=.*[a_z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,16}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate(with: password)
        return result
    }
    
}

