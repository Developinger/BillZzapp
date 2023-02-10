//
//  SignupViewController.swift
//  BillZzapp
//
//  Created by Petit Bradley on 2/3/23.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBOutlet var emailText:UITextField!
    @IBOutlet var passwordText:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createUser(_ sender: Any) {
        
        guard let email = emailText.text, let password = passwordText.text else{return}
        
        Auth.auth().createUser(withEmail: email, password: password)
    }
    
    Signin

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
