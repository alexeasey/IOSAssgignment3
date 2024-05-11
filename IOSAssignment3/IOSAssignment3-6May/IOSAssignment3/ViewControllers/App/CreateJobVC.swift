//
//  CreateJobsViewController.swift
//
//  IOSAssignment3
//
//  Created by Alex Easey on 5/5/2024.
//

import UIKit
import FirebaseDatabase

class CreateJobVC: BaseClass {
    
    
    @IBOutlet weak var jobTitleTF: UITextField!
    
    @IBOutlet weak var jobDescriptionTF: UITextField!
    
    @IBOutlet weak var jobAmoutTF: UITextField!
    
    let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobTitleTF.setLeftPaddingPoints(20)
        jobDescriptionTF.setLeftPaddingPoints(20)
        jobAmoutTF.setLeftPaddingPoints(20)
    }
    
    @IBAction func createJobBtnPressed(_ sender: Any) {
        self.startLoading()
        guard let name = jobTitleTF.text,
              let description = jobDescriptionTF.text,
              let amount = jobAmoutTF.text,
              !name.isEmpty, !description.isEmpty, !amount.isEmpty
        else {
            self.stopLoading()
            showAlert(msg: AlertConstants.FillAll)
            return}
        
        guard let id = database.child("Jobs").childByAutoId().key else { return }
        
        let object: [String: Any] = [
            "id" : id,
            "jobTitle" : "\(name)",
            "description" : "\(description)" as NSObject,
            "jobAmount" : "$ \(amount)"
        ]
        
        database.child("Jobs").child(id).setValue(object)
        self.stopLoading()
        
        self.showAlert(title: AlertConstants.Success, msg: AlertConstants.JobCreated, btn: AlertConstants.Ok)
        jobTitleTF.text = ""
        jobDescriptionTF.text = ""
        jobAmoutTF.text = ""
        
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        goBack()
    }
    
}
