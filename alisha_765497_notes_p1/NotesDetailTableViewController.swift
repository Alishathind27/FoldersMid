//
//  NotesDetailTableViewController.swift
//  alisha_765497_notes_p1
//
//  Created by MacStudent on 2019-11-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class NotesDetailTableViewController: UITableViewController {

    @IBOutlet var Delete: UIBarButtonItem!
    @IBOutlet var Move: UIBarButtonItem!
    var FolDelegate: FoldersTableViewController?
    
    @IBOutlet var table_view: UITableView!
    var curIndx = -1
    var selRows: [IndexPath]?
    var isVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        table_view.allowsMultipleSelection = true
        Delete.isEnabled = false
        Move.isEnabled = false
        
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

    @IBAction func EditButton(_ sender: UIBarButtonItem)
    {
        if !Delete.isEnabled
        {
            Delete.isEnabled = true
            Move.isEnabled = true
        }
        else{
            Delete.isEnabled = false
                   Move.isEnabled = false
        }
    }
    
    @IBAction func Delete(_ sender: UIBarButtonItem)
    {
        let alertController = UIAlertController(title: "Delete", message: "Are you Sure", preferredStyle: .alert)
        let CancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Delete", style: .default){(action) in
            self.deleteRow() }
        
            alertController.addAction(CancelAction)
            alertController.addAction(deleteAction)
            self.present(alertController, animated: true, completion: nil)
    }
        
       func move(Index: Int)
       {
        selRows = table_view.indexPathsForSelectedRows!
        for item in selRows!{
            let NoteMove = FolderData.Detail[(FolDelegate?.curInd)!].Notes[item.row]
            FolderData.Detail[Index].Notes.append(NoteMove)
        }
        deleteRow()
        }
        
    
    
        func deleteRow()
        {
        if let selectedRows = tableView.indexPathsForSelectedRows{
        var item = [String]()
        for indexPath in selectedRows{
            item.append(FolderData.Detail[(FolDelegate?.curInd)!].Notes[indexPath.row])
        }
        for i in item {
        if let index = FolderData.Detail[(FolDelegate?.curInd)!].Notes.index(of: i)
        {
            FolderData.Detail[(FolDelegate?.curInd)!].Notes.remove(at: index)
        }
        }
        tableView.beginUpdates()
        tableView.deleteRows(at: selectedRows, with: .automatic)
        tableView.endUpdates()
        }
        }

        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table_view.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
         table_view.cellForRow(at: indexPath)?.accessoryType = .detailButton
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
//       let DetailNotes = segue.destination as! NotesDetailViewController
//              DetailNotes.notesTable = self
        let DetailView = segue.destination as? NotesDetailViewController
        DetailView?.notesTable = self
        
        if let tableViewCell = sender as? UITableViewCell{
            if let index = tableView.indexPath(for: tableViewCell)?.row{
//                DetailNotes.textString = Notes![index]
                DetailView?.textString = FolderData.Detail[(FolDelegate?.curInd)!].Notes[index]
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
