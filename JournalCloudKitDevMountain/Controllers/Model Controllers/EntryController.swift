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
                print("there was an error saving to CloudKit in > EntryController.swift line 27: \(error.localizedDescription) ")
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
        
        let predicate = NSPredicate(value: true)
        
        let cloudKitQuery = CKQuery(recordType: "Entry", predicate: predicate)
        
        CKContainer.default().privateCloudDatabase.perform(cloudKitQuery, inZoneWith: nil) { (cloudKitRecords, error) in
            
            if let error = error {
                print("there was an error fetching from CloudKit in > EntryController.swift line 56: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            guard let cloudKitRecords = cloudKitRecords else {
                completion(false)
                return
            }
            
            var newEntries: [Entry] = []
            
            for cloudKitRecord in cloudKitRecords {
                guard var newEntryFromCloud = Entry(cloudKitRecord: cloudKitRecord) else {
                    print("there was an error in Entry's failable initializer while using it in > EntryController.swift line 70")
                    return
                }
                newEntries.append(newEntryFromCloud)
            }
            
            self.entries = newEntries
            
            completion(true)
        }
    }
}






















