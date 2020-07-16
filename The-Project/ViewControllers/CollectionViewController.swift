//
//  CollectionViewController.swift
//  The-Project
//
//  Created by user171840 on 7/13/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController{
    var tours = [Response]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  collectionView.delegate = self
        //collectionView.dataSource = self
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


extension CollectionViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCell", for: indexPath) as! RecommendedCell
       /* if Double(arr[indexPath.row].rating) != nil {
        if Double(arr[indexPath.row].rating)! > 4.0 {
            let currentTour = arr[indexPath.row]
            cell.recommendedLabel?.text = arr[indexPath.row].tourName
            currentTour.imageUrl.downloadImage { (image) in
                    DispatchQueue.main.async {
                    cell.recommendedImage.image = image
                        self.recommendedCollection.reloadData()
                    }
            }
        } else {
            cell.recommendedLabel.text = "rating"
            }*/
        cell.recommendedLabel.text = "text"
        return cell
    }

}
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }

}
