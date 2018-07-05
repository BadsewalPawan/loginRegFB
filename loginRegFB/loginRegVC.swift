//
//  ViewController.swift
//  Cerca
//
//  Created by Pawan Badsewal on 28/03/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class loginRegVC: UIViewController, UITextFieldDelegate {
    
    var currentUser:User?
    @IBOutlet var LoginView: GradientView!
    @IBOutlet var RegisterView: GradientView!
    @IBOutlet var emailTxtField: UITextField!
    @IBOutlet var passTxtField: UITextField!
    @IBOutlet var errorlbl: UILabel!
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    
    @IBAction func logReg(_ sender: UIButton) {
        if (emailTxtField.text != nil && passTxtField.text != nil ){
            switch sender.tag{
            case 1:
                Auth.auth().createUser(withEmail: emailTxtField.text!, password: passTxtField.text!) { (user, error) in
                    if (user != nil){
                        self.performSegue(withIdentifier: "loginSegue", sender: Any?.self)
                        self.currentUser = Auth.auth().currentUser
                    }else{
                        self.errorlbl.isHidden = false
                        if let signUpError = error?.localizedDescription{
                            self.errorlbl.text = signUpError
                        }else{
                            print("SignUp ERROR")
                        }
                    }
                }
            case 2:
                Auth.auth().signIn(withEmail: emailTxtField.text!, password: passTxtField.text!) { (user, error) in
                    if(user != nil){
                        self.performSegue(withIdentifier: "loginSegue", sender: Any?.self)
                    }else{
                        self.errorlbl.isHidden = false
                        if let signInError = error?.localizedDescription{
                            self.errorlbl.text = signInError
                        }else{
                            print("SignIn ERROR")
                        }
                    }
                }
            default:
                break
            }
        }
    }
    
    @IBAction func switchLogReg(_ sender: UIButton) {
        LoginView.isHidden = true
        RegisterView.isHidden = true
        emailTxtField.isHidden = false
        passTxtField.isHidden = false
        errorlbl.isHidden = true
        switch sender.tag {
        case 1:
            RegisterView.isHidden = false
        case 2:
            LoginView.isHidden = false
        default:
            break
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

