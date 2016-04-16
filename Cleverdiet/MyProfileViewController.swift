//
//  MyDietsControllerViewController.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 9/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit
import SCLAlertView

class MyProfileViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var fatPercentageTextField: UITextField!
    
    @IBAction func deleteUserAndLogout(sender: UIButton) {
        if (UserDataLoader.deleteUser(UserManager.sharedInstance.currentUser!)) {
            UserManager.sharedInstance.currentUser = nil
            goToLoginView()
        }
    }
    
    @IBAction func updateUserInformation(sender: UIButton) {
        if (!canBeUpdated()) {
            showMessageErrorAndHideKeyboard();
            return;
        }
        
        (passwordTextField.text!.isEmpty) ?
            tryToUpdateTheAccountInformationAndGoToDietsView() : tryToUpdateInformationAndPasswordAndGoToDietsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        fillInitialUserData()
    }
    
    func fillInitialUserData() {
        let currentUser = UserManager.sharedInstance.currentUser!
        usernameTextField.text = currentUser.name
        heightTextField.text = String(currentUser.height)
        weightTextField.text = String(currentUser.weight)
        fatPercentageTextField.text = String(currentUser.fat)
    }
    
    func goToLoginView() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("Login") as! ViewController
        self.presentViewController(nextViewController, animated:true, completion:nil)
    }
    
    func goToDietsView() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("LoggedNavegationController") as! UINavigationController
        self.presentViewController(nextViewController, animated:true, completion:nil)
    }
    
    func tryToUpdateTheAccountInformationAndGoToDietsView() {
        if (UserDataLoader.updateUserInformationForUserWithName(usernameTextField.text!, height: Double(heightTextField.text!)!, weight: Double(weightTextField.text!)!, fat: Double(fatPercentageTextField.text!)!)) {
            UserManager.sharedInstance.currentUser = UserDataLoader.downloadFromDatabase(usernameTextField.text!)
            goToDietsView()
        }
    }
    
    func tryToUpdateInformationAndPasswordAndGoToDietsView() {
        if (UserDataLoader.updateUserInformationForUserWithName(usernameTextField.text!, height: Double(heightTextField.text!)!, weight: Double(weightTextField.text!)!, fat: Double(fatPercentageTextField.text!)!, password: passwordTextField.text!)) {
            UserManager.sharedInstance.currentUser = UserDataLoader.downloadFromDatabase(usernameTextField.text!)
            goToDietsView()
        }
    }
    
    func canBeUpdated() -> Bool {
        return !usernameTextField.text!.isEmpty && !heightTextField.text!.isEmpty && !weightTextField.text!.isEmpty && !fatPercentageTextField.text!.isEmpty
    }
    
    func showMessageErrorAndHideKeyboard() {
        SCLAlertView().showError("Wooo!", subTitle: "It seems like you have not introduced all information. Can you take a look?")
        view.endEditing(true)
    }
    
    
}
