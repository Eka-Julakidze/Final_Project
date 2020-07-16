//
//  ViewController.swift
//  The-Project
//
//  Created by user171840 on 7/5/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
import CoreData
import GoogleSignIn

class SignInOrRegister: UIViewController, SettingsPageDelegate, RegisterPageProtocol, SignOut {
    static let id = "SignInOrRegister"
    @IBOutlet var signInButton: GIDSignInButton!
    @IBOutlet weak var normalSignIn: UIButton!
    @IBOutlet weak var normalRegistration: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
  
    var users = [User]()
   // let shared = Core()
    
    /*override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUer() {
            let vc = storyboard?.instantiateViewController(identifier: "welcome") as! WelcomeViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
                
        }
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        setupButtonDesigns()
        clearFields()
        print("App launched")
    }
   
    
    
    
    private func setupButtonDesigns() {
    signInButton.layer.cornerRadius = 25
    signInButton.layer.borderColor = UIColor.systemTeal.cgColor
    signInButton.layer.borderWidth = 3
    
    normalSignIn.layer.cornerRadius = 25
    normalSignIn.layer.borderColor = UIColor.blue.cgColor
    normalSignIn.layer.borderWidth = 3
    
    normalRegistration.layer.cornerRadius = 25
    normalRegistration.layer.borderColor = UIColor.systemTeal.cgColor
    normalRegistration.layer.borderWidth = 3
        
    passwordField.layer.borderColor = UIColor.systemTeal.cgColor
    passwordField.layer.borderWidth = 3
    
    usernameField.layer.borderColor = UIColor.systemTeal.cgColor
    usernameField.layer.borderWidth = 3
        
    }
    
    func clearFields() {
        usernameField.text = ""
        passwordField.text = ""
    }
    
    func reloadUsers() {
        users = fetchUsers()
    }
    @IBAction func onNormalSignIn(_ sender: UIButton) {
        
         let matchingUser = users.filter{(user) -> Bool in user.username == usernameField.text && user.password == passwordField.text}
         if matchingUser.count != 0 {
            print("successful")
            
            /*if Core.shared.isNewUer() {
            let vc = storyboard?.instantiateViewController(identifier: "welcome") as! WelcomeViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            }*/
            let tabBarController = storyboard?.instantiateViewController(withIdentifier: TabBarController.id) as! TabBarController
             tabBarController.modalPresentationStyle = .fullScreen
             tabBarController.currentUser = matchingUser.first
             tabBarController.tabBarDelegate = self
             
             present(tabBarController, animated: true, completion: nil)
         } else {
             let alert = UIAlertController(title: "Failed", message: "Username or Password is incorrect", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
             self.present(alert,animated: true)
             clearFields()
         }

        
    }
    
    @IBAction func onNormalRegistration(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let addVC = storyBoard.instantiateViewController(withIdentifier: Registration.id)
        
        if let unwrappedVC = addVC as? Registration { 
            unwrappedVC.users = self.users
            unwrappedVC.delegate = self
        }
        self.navigationController?.pushViewController(addVC, animated: true)
    }
}

extension SignInOrRegister {
    func fetchUsers() -> [User]{
        let context = AppDelegate.coreDataContainer.viewContext
        let request: NSFetchRequest<User> = User.fetchRequest()
        do {
            let fetchedUsers = try context.fetch(request)
            
            return fetchedUsers
        } catch { return [User]() }
        
    }
    
}

class Core {
    static let shared = Core()
    
    func isNewUer() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}

