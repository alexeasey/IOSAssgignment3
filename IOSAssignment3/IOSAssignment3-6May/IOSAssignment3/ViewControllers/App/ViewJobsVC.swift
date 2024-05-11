//
//  ViewJobsViewController.swift
//
//  IOSAssignment3
//
//  Created by Alex Easey on 5/5/2024.
//

import UIKit
import FirebaseDatabase

class ViewJobsVC: UIViewController {
    
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref.child("Jobs").observe(.value){ (snapshot) in
            for child in snapshot.children{
                let test = child as! DataSnapshot
                let key = test.key
                let value = test.value!
                
                print(key, " :", value)
            }
        }
    }
}

