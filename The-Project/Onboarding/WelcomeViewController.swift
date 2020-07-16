//
//  WelcomeViewController.swift
//  The-Project
//
//  Created by user171840 on 7/11/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
import CoreData
import GoogleSignIn

class WelcomeViewController: UIViewController {
    @IBOutlet var holderView: UIView!
    let scrollView = UIScrollView()
    let label: UILabel = {
        let l = UILabel()
        l.frame =  CGRect(x: 10, y: 10, width: 400, height: 120)
        return l
    }()
    var titles = ["Account", "Favourite", "Advanture"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
        self.view.addSubview(label)
    }
    private func configure() {
        //scrollView.frame = view.bounds
       // view.addSubview(scrollView)
       
        for item in 0..<3 {
            let pageView = UIView(frame: CGRect(x: CGFloat(item) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            view.addSubview(pageView)
            //label, image, button
           // label.frame =  CGRect(x: 10, y: 10, width: pageView.frame.size.width-20, height: 120)
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10+10+120, width: pageView.frame.size.width-20, height: pageView.frame.size.height - 60 - 130 - 15))
            let button = UIButton(frame: CGRect(x: 10, y: imageView.frame.origin.y - 40, width: pageView.frame.size.width-20, height: 50))
            
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica-bold", size: 32)
            //label.text = titles[item]
            
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "welcome_\(item)")
            pageView.addSubview(imageView)
       
            
             
                button.addTarget(self, action: #selector(didTapButton(_ :)), for: .touchUpInside)
                
            
            button.tag = item
            button.setTitleColor(.white, for: .normal)
            button.setTitle("CONTINUE", for: .normal)
            if item == 2 {
                button.setTitle("Get Started", for: .normal)
            }
            button.backgroundColor = .cyan
            button.layer.cornerRadius = 15
            pageView.addSubview(button)
            
            //scrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: 0)
            //scrollView.isPagingEnabled = true
        }

            
            
        
        
        
    }
    @objc func didTapButton(_ button: UIButton) {
        print(titles[button.tag])
        label.text = titles[button.tag]
    }
    /*@objc func didTapButton(_ button: UIButton) {
        print("did Tap")
        guard button.tag < 3 else {
            Core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
            return}
        
        
        
        scrollView.setContentOffset(CGPoint(x: view.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
        print(titles[button.tag - 1 ])
        
    
        label.text = titles[button.tag - 1]
    }*/
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
