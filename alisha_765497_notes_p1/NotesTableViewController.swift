//
//  NotesTableViewController.swift
//  alisha_765497_notes_p1
//
//  Created by MacStudent on 2019-11-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

    
    var folders: [String]?
    var curInd = -1
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        folders = []
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .lightGray
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return folders?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard folders != nil else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "Folder", for: indexPath)
        cell.textLabel?.text = folders![indexPath.row]
        cell.imageView?.image = UIImage(named: "folder-icon")
        

        // Configure the cell...

        return cell
    }
    

    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionController = UIContextualAction(style: .destructive, title: "Delete") {(action,view, _) in
        self.folders?.remove(at: indexPath.row)
        self.tableView.reloadData()
        
        }
        return UISwipeActionsConfiguration(actions: [actionController])
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let detailNotes = segue.destination as! DetailViewController
        detailNotes.NoteTable = self
        
//        if let tableViewcell = sender as? UITableViewCell{
//            if let index = tableView.indexPath(for: tableViewCell)?.row{
//            detailNotes.textString = folders![index]
//            curInd = index
        
        
        
    }
        
        func updateNotes(text: String)
        {
            guard folders != nil && curInd != -1 else {return}
            folders![curInd] = text
            
//           let indexPath = IndexPath(item: curInd, section: 0)
//          tableView.reloadData(at: [indexPath], with: .middle)
        }
        
    
    

    @IBAction func NewFolder(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "New Folder", message: "Enter a name for folder", preferredStyle: .alert )
        
        alertController.addTextField{ (textField) in textField.placeholder = "Name"}
        
        
        
        
        let Cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        Cancel.setValue(UIColor.brown, forKey: "titleTextColor")
        alertController.addAction(Cancel)
        
        alertController.addAction(UIAlertAction (title: "Add Item ", style: .default, handler: {
            (action) in
            let Str = alertController.textFields?.first?.text
            self.folders?.append(Str!)
            self.tableView.reloadData()
            
        }))
        alertController.view.tintColor = .black
        self.present(alertController, animated:  true, completion: nil)

    }
}
