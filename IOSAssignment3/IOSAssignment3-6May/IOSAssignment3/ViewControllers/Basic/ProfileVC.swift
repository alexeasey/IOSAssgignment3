//
//  ProfileVC.swift
//
//  IOSAssignment3
//
//  Created by Umer on 5/5/2024.
//

import UIKit
import FirebaseAuth
import FirebaseDatabaseInternal

class ProfileVC: BaseClass {
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var phoneNoLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Retrieve the current user's UID
        guard let currentUserUID = Auth.auth().currentUser?.uid else {
            // Handle the case when the user is not authenticated
            return
        }

        // Reference to the current user's data in Firebase
        let userRef = Database.database().reference().child("User").child(currentUserUID)

        // Fetch user data from Firebase
        userRef.observeSingleEvent(of: .value) { (snapshot)  in
            if let userData = snapshot.value as? [String: Any] {
                // Extract user's name and email from userData dictionary
                if let name = userData["name"] as? String,
                   let email = userData["email"] as? String {
                    // Populate UI elements with user information
                    self.nameLbl.text = name
                    self.emailLbl.text = email
                }
            }
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        goBack()
    }
    
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            
            UserDefaults.standard.setValue(false, forKey: UDKeys.isUserRegisted)
            
            print("User Logout Successfull")
            
            self.pushVC(nameOfVC: WelcomeVC.id, storyboardName: .Main)
            
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        
    }
    
}
