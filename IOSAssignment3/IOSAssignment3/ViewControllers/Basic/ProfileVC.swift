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
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var uniLbl: UILabel!
    @IBOutlet weak var degreeLbl: UILabel!



    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchUserInfo()
    }
    
    func fetchUserInfo() {
        guard let currentUserUID = Auth.auth().currentUser?.uid else {
            print("User not authenticated")
            return
        }

        let userRef = Database.database().reference().child("User").child(currentUserUID)

        userRef.observeSingleEvent(of: .value) { (snapshot)  in
            guard snapshot.exists() else {
                print("Snapshot does not exist")
                return
            }

            guard let userData = snapshot.value as? [String: Any] else {
                print("Failed to parse snapshot data")
                return
            }

            // Populate UI elements with user information
            if let name = userData["name"] as? String {
                self.nameLbl.text = " \(name)"
            }
            if let email = userData["email"] as? String {
                self.emailLbl.text = " \(email)"
            }
            if let phone = userData["phone"] as? String {
                self.phoneNoLbl.text = " \(phone)"
            }
            if let address = userData["address"] as? String {
                self.addressLbl.text = " \(address)"
            }
            if let universty = userData["universty"] as? String {
                self.uniLbl.text = " \(universty)"
            }
            if let degree = userData["degree"] as? String {
                self.degreeLbl.text = " \(degree)"
            }
        }
    }

    
    @IBAction func backBtnPressed(_ sender: Any) {
     //   goBack()
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
