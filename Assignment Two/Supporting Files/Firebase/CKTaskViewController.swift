//
//  CKTaskViewController.swift
//
//  Created for Biodesign's CS342
//  Copyright © 2019 Stanford University.
//  All rights reserved.
//

import UIKit
import SwiftUI
import ResearchKit
import Firebase

struct CKTaskViewController: UIViewControllerRepresentable, Identifiable {
    
    let id = UUID()
    
    typealias UIViewControllerType = ORKTaskViewController
    
    let vc: ORKTaskViewController
    
    init(tasks: ORKOrderedTask) {
        self.vc = ORKTaskViewController(task: tasks, taskRun: NSUUID() as UUID)
    }
    
    func makeCoordinator() -> CKTaskCoordinator {
        CKTaskCoordinator()
    }
    
    func updateUIViewController(_ taskViewController: ORKTaskViewController, context: Context) { }
    func makeUIViewController(context: Context) -> ORKTaskViewController {
        
        if vc.outputDirectory == nil {
            vc.outputDirectory = context.coordinator.CKGetTaskOutputDirectory(vc)
        }
        
        self.vc.delegate = context.coordinator // enables `ORKTaskViewControllerDelegate` below
        
        // & present the VC!
        return self.vc
    }
    
}

class CKTaskCoordinator: NSObject {
    
    /**
     Given a JSON dictionary, use the Firebase SDK to store it in Firestore.
    */
    func CKSendJSON(_ json: [String:Any]) throws {
        
        if  let identifier = json["identifier"] as? String,
            let taskUUID = json["taskRunUUID"] as? String,
            let authCollection = CKStudyUser.shared.authCollection,
            let userId = CKStudyUser.shared.currentUser?.uid {
            
            let dataPayload: [String:Any] = ["userId":"\(userId)", "payload":json]
            
            // If using the CardinalKit GCP instance, the authCollection
            // represents the directory that you MUST write to in order to
            // verify and access this data in the future.
            
            let db = Firestore.firestore()
            db.collection(authCollection + "surveys").document(identifier + "-" + taskUUID).setData(dataPayload) { err in
                
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
            
        }
    }
    
    /**
     Parse a result from a ResearchKit task and convert to a dictionary.
     JSON-friendly.

     - Parameters:
        - result: original `ORKTaskResult`
     - Returns: [String:Any] dictionary with ResearchKit `ORKTaskResult`
    */
    func CKTaskResultAsJson(_ result: ORKTaskResult) throws -> [String:Any]? {
        let jsonData = try ORKESerializer.jsonData(for: result)
        return try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String : Any]
    }
    
    /**
    Create an output directory for a given task.
    You may move this directory.
     
     - Returns: URL with directory location
    */
    func CKGetTaskOutputDirectory(_ taskViewController: ORKTaskViewController) -> URL? {
        do {
            let defaultFileManager = FileManager.default
            
            // Identify the documents directory.
            let documentsDirectory = try defaultFileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
            // Create a directory based on the `taskRunUUID` to store output from the task.
            let outputDirectory = documentsDirectory.appendingPathComponent(taskViewController.taskRunUUID.uuidString)
            try defaultFileManager.createDirectory(at: outputDirectory, withIntermediateDirectories: true, attributes: nil)
            
            return outputDirectory
        }
        catch let error as NSError {
            print("The output directory for the task with UUID: \(taskViewController.taskRunUUID.uuidString) could not be created. Error: \(error.localizedDescription)")
        }
        
        return nil
    }

}
