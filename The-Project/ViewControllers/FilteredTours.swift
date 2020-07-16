//
//  FilteredTours.swift
//  The-Project
//
//  Created by user171840 on 7/14/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class FilteredTours: UIViewController {

    @IBOutlet weak var filteredCategoryCollection: UICollectionView!
    var filteredTours = [Response]()
    override func viewDidLoad() {
        super.viewDidLoad()

        filteredCategoryCollection.dataSource = self
        filteredCategoryCollection.delegate = self
    }

}


extension FilteredTours : UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredTours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = filteredCategoryCollection.dequeueReusableCell(withReuseIdentifier: "FilteredCell", for: indexPath) as! FilteredCell
        
        let currentTour = filteredTours[indexPath.row]
        //cell.tourNameLabel?.text = currentTour[indexPath.row]
        
        return cell
        
      //  let currentBand = bands[indexPath.row]
        
       /* cell.bandNameLabel.text = currentBand.name
        currentBand.imageUrl.downloadImage { (image) in
        DispatchQueue.main.async {
            cell.bandImageView.image = image
            }
        }
        
        return cell*/
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailViewController.chosenTour = arr[indexPath.row]
        detailViewController.bindData()
        //detailViewController.selectedBand = bands[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
}


extension FilteredTours: UICollectionViewDelegateFlowLayout {

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let itemWith = collectionView.frame.width / 2
    
    return CGSize(width: itemWith - 5 - 5, height: 200)
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: 30, left: 5, bottom: 0, right: 5)
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 5
}
}
