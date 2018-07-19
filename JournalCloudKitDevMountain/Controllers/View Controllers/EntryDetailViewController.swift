//
//  EntryDetailViewController.swift
//  JournalCloudKitDevMountain
//
//  Created by Michael Guatambu Davis on 7/18/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    
    
    // MARK: - ViewController Lifecycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }


    // MARK: - Actions
    
    @IBAction func claerTextButtonTapped(_ sender: Any) {
        
        titleTextField.text = ""
        bodyTextView.text = ""
        
    }
    
    @IBAction func saveEntryButtonTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        guard let entry = entry else { return }
        
        titleTextField.text = entry.title
        bodyTextView.text = entry.text
    }
    
    
    // MARK: - UITextFieldDelegate functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
