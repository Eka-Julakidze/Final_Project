//
//  FilteredList.swift
//  The-Project
//
//  Created by user171840 on 7/14/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

/*class FilteredList: UITableViewController {

    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var table: UITableView!
    
    var toursList = [Response]()
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toursList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilteredListCell", for: indexPath) as! FilteredListCell

        cell.tourLabel.text = "FilteredListCell"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = storyboard?.instantiateViewController(withIdentifier: DetailsViewController.id) as! DetailsViewController
            //detailViewController.chosenTour = tours[indexPath.row]
            //filteredDestination.filteredTours = array
        navigationController?.pushViewController(details, animated: true)
    }
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }R
    */

}*/
