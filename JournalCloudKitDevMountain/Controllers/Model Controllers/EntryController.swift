//
//  EntryController.swift
//  JournalCloudKitDevMountain
//
//  Created by Michael Guatambu Davis on 7/18/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import Foundation
import CloudKit

class EntryController {
    
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    
    func save(entry: Entry, completion: @escaping((_ success: Bool) -> Void)) {
        
        let entryCloudKitRecord = CKRecord(withEntry: entry)
        
        CKContainer.default().privateCloudDatabase.save(entryCloudKitRecord) { (cloudKitRecord, error) in
            
            if let error = error {
                print("there was an error in > EntryController.swift line 27: \(error.localizedDescription) ")
            } else {
                self.entries.append(entry)
            }
        }
    }
    
    func addEntryWith(title: String, text: String, completion: @escaping((_ success: Bool) -> Void)) {

        // MARK: - lil help here... where does the cloudKitRecord come from for the memberwise initializer?
        var newEntry = Entry(title: title, text: text, cloudKitRecordID: <#T##CKRecordID#>)
        
        self.save(entry: newEntry) { (success) in
            if success {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func fetchEntries(completion: @escaping(_ success: Bool) -> Void) {
        
        
    }
    
}






















