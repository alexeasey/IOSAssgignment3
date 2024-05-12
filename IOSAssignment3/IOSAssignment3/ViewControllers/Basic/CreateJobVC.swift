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
    @IBOutlet weak var comanyNameTF: UITextField!
    @IBOutlet weak var jobDescriptionTF: UITextField!
    @IBOutlet weak var jobAmoutTF: UITextField!
    @IBOutlet weak var jobLocationTF: UITextField!
    @IBOutlet weak var timingTF: UITextField!
    @IBOutlet weak var companyEmialTF: UITextField!
    @IBOutlet weak var companyPhoneNoTF: UITextField!
    
    let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobTitleTF.setLeftPaddingPoints(20)
        comanyNameTF.setLeftPaddingPoints(20)
        jobDescriptionTF.setLeftPaddingPoints(20)
        jobAmoutTF.setLeftPaddingPoints(20)
        jobLocationTF.setLeftPaddingPoints(20)
        timingTF.setLeftPaddingPoints(20)
        companyEmialTF.setLeftPaddingPoints(20)
        companyPhoneNoTF.setLeftPaddingPoints(20)
    }
    
    @IBAction func createJobBtnPressed(_ sender: Any) {
        self.startLoading()
        guard let name = jobTitleTF.text,
              let description = jobDescriptionTF.text,
              let amount = jobAmoutTF.text,
              let company = comanyNameTF.text,
              let location = jobLocationTF.text,
              let timing = timingTF.text,
              let companyEmail = companyEmialTF.text,
              let companyPhone = companyPhoneNoTF.text,
              
              !name.isEmpty, !description.isEmpty, !amount.isEmpty,
              !company.isEmpty, !location.isEmpty, !timing.isEmpty,!companyEmail.isEmpty, !companyPhone.isEmpty else {
            self.stopLoading()
            showAlert(msg: AlertConstants.FillAll)
            return }
        
        guard let id = database.child("Jobs").childByAutoId().key else { return }
        
        let object: [String: Any] = [
            "id" : id,
            "jobTitle" : "\(name)",
            "jobLocation" : "\(location)",
            "companyName" : "\(company)",
            "jobTiming" : "\(timing)",
            "jobDescription" : "\(description)",
            "jobAmount" : "$ \(amount)",
            "companyEmail" : "\(companyEmail)",
            "companyPhone" : "\(companyPhone)"
        ]
        
        database.child("Jobs").child(id).setValue(object)
        self.stopLoading()
        
        self.showAlert(title: AlertConstants.Success, msg: AlertConstants.JobCreated, btn: AlertConstants.Ok)
        jobTitleTF.text = ""
        comanyNameTF.text = ""
        jobDescriptionTF.text = ""
        jobAmoutTF.text = ""
        jobLocationTF.text = ""
        timingTF.text = ""
        companyEmialTF.text = ""
        companyPhoneNoTF.text = ""
        
        
    }
    @IBAction func backBtnPressed(_ sender: Any) {
     //   goBack()
    }
    
}
