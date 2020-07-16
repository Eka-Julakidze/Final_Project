//
//  SettingsViewController.swift
//  The-Project
//
//  Created by user171840 on 7/14/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var delegate : SettingsPageDelegate?
    var currentUser: User?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDetails()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onEdit(_ sender: UIButton) {
        saveUser()
    }
    
    
    func loadDetails(){
        nameField.text = currentUser!.firstName
        lastNameField.text = currentUser!.lastName
        emailField.text = currentUser!.email
        userNameField.text = currentUser!.username
        passwordField.text = currentUser!.password
    }
    
    func saveUser(){
           let context = AppDelegate.coreDataContainer.viewContext 
           currentUser!.firstName = nameField.text ?? ""
           currentUser!.lastName = lastNameField.text ?? ""
           currentUser!.email = emailField.text ?? ""
           if passwordField.text != ""{
               currentUser!.password = passwordField.text
           }
           if userNameField.text != ""{
               currentUser!.username = userNameField.text
           }
           do {
               try context.save()
               let alert = UIAlertController(title: "Edit", message: "Edit was successful", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               self.present(alert,animated: true)
           } catch{
               print("failed")
           }
       }
}
