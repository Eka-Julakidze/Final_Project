//
//  Two.swift
//  The-Project
//
//  Created by user171840 on 7/11/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class Two: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func button(_ sender: UIButton) {
        self.performSegue(withIdentifier: "secondSegue", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
