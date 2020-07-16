//
//  ExplorePage.swift
//  The-Project
//
//  Created by user171840 on 7/13/20.
//  Copyright © 2020 Student. All rights reserved.
//
import UIKit
protocol SignOut {
    func clearFields()
}
class ExplorePage: UIViewController {
    
    static let id = "ExplorePage"
    @IBOutlet weak var exploreTableView: UITableView!
    public var array = [Response]()
    public var tours = [Response]()
    public var categories: [String] = ["Advanture", "Cultural", "City Tour", "Eco", "Winter", "Wine"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exploreTableView.delegate = self
        exploreTableView.dataSource = self
        
        getInfo { (objectsResponse) in
            for item in objectsResponse{
                DispatchQueue.main.async {
                    self.tours.append(item)
                    self.exploreTableView.reloadData()
                }
            }
        }
        
        
       
    }
    
    @IBAction func onSignOutButton(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
}

extension ExplorePage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = exploreTableView.dequeueReusableCell(withIdentifier: ExploreCell.id, for: indexPath) as! ExploreCell
        
        cell.categoryLabel?.text = categories[indexPath.row] 
        cell.categoryImage.image = UIImage(named: categories[indexPath.row])
        switch cell.categoryLabel.text  {
            case "Winter":
                cell.categoryLabel.textColor = UIColor.cyan
            case "Wine":
                cell.categoryLabel.textColor = UIColor.red
            case "Eco":
                cell.categoryLabel.textColor = UIColor.green
            case "Cultural":
                cell.categoryLabel.textColor = UIColor.lightGray
            case "Advanture":
                cell.categoryLabel.textColor = UIColor.blue
            case "City Tour":
                cell.categoryLabel.textColor = UIColor.systemTeal
            
            default:
                print("end of categories")
            }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        exploreTableView.deselectRow(at: indexPath, animated: true)
        
        let filteredDestination = storyboard?.instantiateViewController(withIdentifier:FilteredList.id) as! FilteredList

        for item in 0..<tours.count {
            if categories[indexPath.row] == tours[item].category {
                filteredDestination.toursList.append(tours[item])
            }
        }

        navigationController?.pushViewController(filteredDestination, animated: true)
      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}


extension String {
    
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: self) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
        }.resume()
    }
    
}

