//
//  V.swift
//  The-Project
//
//  Created by user171840 on 7/14/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class FilteredList: UIViewController {
    static let id = "FilteredList"
    @IBOutlet weak var table: UITableView!
    var toursList = [Response]()
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
    }
    
}

extension FilteredList: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toursList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilteredListCell.id, for: indexPath) as! FilteredListCell
         let currentTour = toursList[indexPath.row]
         cell.tourLabel.text = currentTour.tourName
        
        /*currentTour.url.downloadImage { (image) in
        DispatchQueue.main.async {
            cell.tourImage.image = image
            }
        }*/
    
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = storyboard?.instantiateViewController(withIdentifier: DetailsViewController.id) as! DetailsViewController
        details.chosenTour = toursList[indexPath.row]
        //details.bindData()
        navigationController?.pushViewController(details, animated: true)

    }
    
    
}
