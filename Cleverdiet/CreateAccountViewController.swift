 //
//  CreateAccountViewController.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 12/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit
import SCLAlertView

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var fatPercentageTextField: UITextField!
    
    @IBAction func createAccountAction(sender: UIButton) {
        if (formIsFilling()) {
            let user = User(name: usernameTextField.text!, password: passwordTextField.text!, height: Double(heightTextField.text!)!, weight: Double(weightTextField.text!)!, fat: Double(fatPercentageTextField.text!)!)
            if (UserDataLoader.createUser(user)) {
                UserManager.sharedInstance.currentUser = UserDataLoader.downloadFromDatabase(usernameTextField.text!)
                goToDietsView()
            }
        } else {
            showMessageErrorAndHideKeyboard()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func goToDietsView() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("LoggedNavegationController") as! UINavigationController
        self.presentViewController(nextViewController, animated:true, completion:nil)
    }
    
    private func formIsFilling()-> Bool {
        return !(usernameTextField.text?.isEmpty)! &&
            !(passwordTextField.text?.isEmpty)! &&
            !(heightTextField.text?.isEmpty)! &&
            !(weightTextField.text?.isEmpty)! &&
            !(fatPercentageTextField.text?.isEmpty)!
    }
    
    func showMessageErrorAndHideKeyboard() {
        SCLAlertView().showError("Wooo!", subTitle: "It seems like you have not introduced all information. Can you take a look?")
        view.endEditing(true)
    }

}
