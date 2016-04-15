//
//  ViewController.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 8/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit
import SWXMLHash

class ViewController: UIViewController {
    @IBOutlet weak var createAccountbutton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!

    @IBAction func checkAuthenticationAction(sender: UIButton) {
        if (UserDataLoader.userExists(usernameTextField.text!, password: passwordTextField.text!) == true) {
            UserManager.sharedInstance.currentUser = UserDataLoader.downloadFromDatabase(usernameTextField.text!)
            goToDietsView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func goToDietsView() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("LoggedNavegationController") as! UINavigationController
        self.presentViewController(nextViewController, animated:true, completion:nil)
    }

}

