//
//  Entry.swift
//  JournalCloudKitDevMountain
//
//  Created by Michael Guatambu Davis on 7/18/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import Foundation
import CloudKit

class Entry {
    
    private let TitleKey = "title"
    private let TextKey = "text"
    private let CloudKitRecordIDKey = "ckRecordID"
    
    var title: String
    var text: String
    let cloudKitRecordID: CKRecordID
    
    init(title:String, text: String, cloudKitRecordID: CKRecordID) {
        self.title = title
        self.text = text
        self.cloudKitRecordID = cloudKitRecordID
    }
    
    init?(cloudKitRecord: CKRecord) {
        guard   let title = cloudKitRecord[TitleKey] as? String,
                let text = cloudKitRecord[TextKey] as? String,
                let cloudKitRecordID = cloudKitRecord[CloudKitRecordIDKey] as? CKRecordID
            else { return nil }
        
        self.title = title
        self.text = text
        self.cloudKitRecordID = cloudKitRecordID
        
    }
}

extension CKRecord {
    
    convenience init(withEntry: Entry) {
        self.init(recordType: "Entry", recordID: withEntry.cloudKitRecordID)
        self.setValue(withEntry, forKey: "Entry")
    }
}





















