//
//  Registeration.swift
//  The-Project
//
//  Created by user171840 on 7/5/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
import CoreData

protocol RegisterPageProtocol {
    func reloadUsers()
   
}

class Registration: UIViewController {
    
    static let id = "Registration"
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    var users = [User]()
    var delegate: RegisterPageProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDesign()
      
    }
    
    private func setupDesign() {
        registerButton.layer.cornerRadius = 25
        registerButton.layer.borderColor = UIColor.systemTeal.cgColor
        registerButton.layer.borderWidth = 3
        navigationItem.title = "REGISTER"
        
        firstNameField.layer.borderColor = UIColor.systemTeal.cgColor
        firstNameField.layer.borderWidth = 3
        lastNameField.layer.borderColor = UIColor.systemTeal.cgColor
        lastNameField.layer.borderWidth = 3
        emailField.layer.borderColor = UIColor.systemTeal.cgColor
        emailField.layer.borderWidth = 3
        usernameField.layer.borderColor = UIColor.systemTeal.cgColor
        usernameField.layer.borderWidth = 3
        passwordField.layer.borderColor = UIColor.systemTeal.cgColor
        passwordField.layer.borderWidth = 3
    }
    
    @IBAction func onRegisterButton(_ sender: UIButton) {
        if usernameField.text != "" && passwordField.text != ""{
            let matchingUser = users.filter{(user) -> Bool in user.username == usernameField.text}
            if matchingUser.count == 0{
                addUser()
                delegate?.reloadUsers()
            }   else {
                      
                let alert = UIAlertController(title: "Registration", message: "The user Already exists", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert,animated: true)
                }
        }
    }
    
    
    func addUser(){
        let context = AppDelegate.coreDataContainer.viewContext
        let newUser = User( context: context)
        
        newUser.firstName = firstNameField.text ?? ""
        newUser.lastName = lastNameField.text ?? ""
        newUser.email = emailField.text ?? ""
        newUser.username = usernameField.text!
        newUser.password = passwordField.text!
        
        do {
            try context.save()
            print(newUser)
            let alert = UIAlertController(title: "Registration", message: "Registration Successful", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                self.navigationController?.popViewController(animated: true)
            }))
            
            self.present(alert,animated: true)
        } catch{
            print("failed")
        }
    }
    

}
