//
//  LoginViewController.swift
//  ParseChatServer
//
//  Created by Mayank Gandhi on 10/08/18.
//  Copyright © 2018 Mayank Gandhi. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {


    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignInPressed(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameTextField.text! , password: passwordTextField.text!)
        { (user: PFUser? ,error: Error?) in
            if user != nil
            {
                print("you have successfully signed in")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else
            {
                print(error?.localizedDescription ?? nil)
            }
            }
    }
    
    @IBAction func SignUpPressed(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        
        newUser.signUpInBackground
            { (success: Bool,error: Error?) in
                if success
                {
                    print("you have successfully signed up")
                }
                else
                {
                    print(error?.localizedDescription ?? nil)
                }
        }
        
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
