//
//  NotesDetailTableViewController.swift
//  alisha_765497_notes_p1
//
//  Created by MacStudent on 2019-11-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class NotesDetailTableViewController: UITableViewController {

    var FolDelegate: FoldersTableViewController?
    
    var curIndx = -1
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return FolderData.Detail[(FolDelegate?.curInd)!].Notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Notes")
        {
         
        // Configure the cell...
            cell.textLabel?.text = FolderData.Detail[(FolDelegate?.curInd)!].Notes[indexPath.row]
        return cell
    }
        return UITableViewCell()
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

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let DetailNotes = segue.destination as! NotesDetailViewController
        DetailNotes.notesTable = self

        if let tableViewCell = sender as? UITableViewCell{
            if let index = tableView.indexPath(for: tableViewCell)?.row{
//                DetailNotes.textString = Notes![index]
                DetailNotes.textString = FolderData.Detail[(FolDelegate?.curInd)!].Notes[index]
//                DetailNotes.textString = FolderData.Detail[index].Notes
                curIndx = index
            }
        }
//        if let tableViewcell = sender as? UITableViewCell{
//      if let index = tableView.indexPath(for: tableViewCell)?.row{
//                   detailNotes.textString = Folders.Notes![index]
//                   curInd = index
//            }}
    }
    
    func updateNotes(text: String)
         {
            tableView.reloadData()
            
            FolDelegate?.FolReload()
            guard FolderData.Detail[(FolDelegate?.curInd)!].Notes != [] && curIndx != -1 else {
                
                FolderData.Detail[(FolDelegate?.curInd)!].Notes.append(text)
                
                FolDelegate?.FolReload()
                tableView.reloadData()
                return
                
            }
            FolderData.Detail[(FolDelegate?.curInd)!].Notes[curIndx] = text
            let IndexValue = IndexPath(item: curIndx, section: 0)
            tableView.reloadRows(at: [IndexValue], with: .middle)
     
}
}
