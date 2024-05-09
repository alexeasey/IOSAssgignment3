//
//  CreateJobsViewController.swift
//
//  IOSAssignment3
//
//  Created by Alex Easey on 5/5/2024.
//

import UIKit
import FirebaseDatabase

class CreateJobsViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var createJobButtonTapped: UIButton!
    
    @IBAction func createJobButtonTapped(_ sender: UIButton) {
        addNewEntry()
    }
    
    private let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc private func addNewEntry(){
        let object: [String: Any] = [
            "desc" : "\(descriptionTextField.text ?? "")" as NSObject,
            "title" : "\(nameTextField.text ?? "")"
        ]
        
        //Needs to be unique Key for different entries
        database.child("Jobs").child("Job\(Int.random(in: 0..<1000))").setValue(object)
    }
    
}
