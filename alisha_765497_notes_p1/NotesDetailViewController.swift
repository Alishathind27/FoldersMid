//
//  NotesDetailViewController.swift
//  alisha_765497_notes_p1
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {
  
    @IBOutlet weak var textView: UITextView!
    var textString: String?
    var notesTable: NotesDetailTableViewController?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.text = textString ?? ""
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        notesTable?.updateNotes(text: textView.text)
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
