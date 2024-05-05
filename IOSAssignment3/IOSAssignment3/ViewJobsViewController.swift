//
//  ViewJobsViewController.swift
//  IOSAssignment3
//
//  Created by Alex Easey on 5/5/2024.
//

import UIKit
import FirebaseDatabase

class ViewJobsViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
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
