//
//  EntryListTableViewController.swift
//  JournalCloudKitDevMountain
//
//  Created by Michael Guatambu Davis on 7/18/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    
    // MARK: - ViewController Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Actions

    @IBAction func addEntryButtonTapped(_ sender: Any) {
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.shared.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryListCell", for: indexPath)
        
        let entry = EntryController.shared.entries[indexPath.row]
        
        // Configure the cell...
        cell.detailTextLabel?.text = entry.title

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "toEntryDetail" {
            
            if let destinationViewController = segue.destination as? EntryDetailViewController {
                
                guard let indexPath = tableView.indexPathForSelectedRow else { return }
                
                let entry = EntryController.shared.entries[indexPath.row]
                
                // Pass the selected object to the new view controller.
                destinationViewController.entry = entry
            }
        }
    }
}
