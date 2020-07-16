//
//  DetailsViewController.swift
//  The-Project
//
//  Created by user171840 on 7/13/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    static let id = "DetailsViewController"
    @IBOutlet weak var tourImage: UIImageView!
    @IBOutlet weak var tourNameLabel: UILabel!
    @IBOutlet weak var tourCategoryLabel: UILabel!
    @IBOutlet weak var tourDistanceLabel: UILabel!
    @IBOutlet weak var tourDurationLabel: UILabel!
    @IBOutlet weak var tourRatingLabel: UILabel!
    @IBOutlet weak var mapButton: UIButton!
    
    var chosenTour: Response?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // bindData()
        configureElements()
        
        DispatchQueue.main.async {
            self.tourNameLabel.text = self.chosenTour?.tourName
            self.tourCategoryLabel.text = self.chosenTour!.category
            self.bindData()
            
        }
    }
    
     func bindData() {
        tourNameLabel.text = chosenTour!.tourName
        tourCategoryLabel.text = chosenTour!.category
        tourDistanceLabel.text = chosenTour!.distance
        tourDurationLabel.text = chosenTour!.duration.rawValue
        tourRatingLabel.text = chosenTour!.rating
    }
    
    private func configureElements() {
        mapButton.layer.cornerRadius = 25
        mapButton.layer.borderWidth = 3
        mapButton.layer.borderColor = UIColor.green.cgColor
        
        tourNameLabel.layer.borderWidth = 3
        tourNameLabel.layer.borderColor = UIColor.green.cgColor
        tourDistanceLabel.layer.borderWidth = 3
        tourDistanceLabel.layer.borderColor = UIColor.green.cgColor
        tourRatingLabel.layer.borderWidth = 3
        tourRatingLabel.layer.borderColor = UIColor.green.cgColor
        tourCategoryLabel.layer.borderWidth = 3
        tourCategoryLabel.layer.borderColor = UIColor.green.cgColor
        tourDurationLabel.layer.borderWidth = 3
        tourDurationLabel.layer.borderColor = UIColor.green.cgColor
        
        
        
    }
    
    @IBAction func onMapButton(_ sender: UIButton) {
        print("map tapped")
        let selectedVC = storyboard?.instantiateViewController(identifier: MapController.id) as! MapController
        selectedVC.tour = chosenTour 
        navigationController?.present(selectedVC, animated: true, completion: nil)
    }
    


}
