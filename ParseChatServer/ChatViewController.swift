//
//  ChatViewController.swift
//  ParseChatServer
//
//  Created by Mayank Gandhi on 13/08/18.
//  Copyright © 2018 Mayank Gandhi. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {
    
    
    @IBOutlet weak var messageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendPressed(_ sender: Any) {
        
        let chatMessage = PFObject(className: "Message")
        chatMessage["text"] = messageField.text ?? ""
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
                self.messageField.text = ""
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
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
