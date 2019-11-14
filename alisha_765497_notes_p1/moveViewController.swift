//
//  moveViewController.swift
//  alisha_765497_notes_p1
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class moveViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var Cancel: UIButton!
    var NotesDelegate: NotesDetailTableViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.lightGray
        self.tableView.backgroundColor = UIColor.lightGray
        self.Cancel.tintColor = .white
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FolderData.Detail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        cell.backgroundColor = UIColor.lightGray
        cell.textLabel?.text = FolderData.Detail[indexPath.row].Folders
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Move \(FolderData.Detail[indexPath.row].Folders)", message: "Are you sure", preferredStyle: .alert)
        let NAction = UIAlertAction(title: "No", style: .default, handler: nil)
        NAction.setValue(UIColor.brown, forKey: "titleTextColour")
        alertController.addAction(NAction)
        
        alertController.addAction(UIAlertAction(title: "Move", style: .default, handler: {(action) in
            
            // move function
            //self.NotesDelegate
        }))
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
