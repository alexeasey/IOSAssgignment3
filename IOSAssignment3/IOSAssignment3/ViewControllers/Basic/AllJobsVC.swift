//
//  AllJobsVC.swift
//
//  IOSAssignment3
//
//  Created by Umer on 11/05/2024.
//

import UIKit
import FirebaseDatabase


struct Job : Codable {
    
    let id  : String
    let jobTitle  : String
    let jobLocation  : String
    let companyName  : String
    let jobTiming  : String
    let jobDescription  : String
    let jobAmount  : String
    let companyEmail  : String
    let companyPhone  : String
    
//    static func initWithDict(_ dict: [String: Any]) -> Job {
//        return Job(id: dict["id"] as? String ?? "", jobTitle: dict["jobTitle"] as? String ?? "", description: dict["description"] as? String ?? "", jobAmount: dict["jobAmount"] as? String ?? "")
//    }
}

class AllJobsVC: BaseClass {

    @IBOutlet weak var tblVw: UITableView!
    
    let ref = Database.database().reference()
    
    var allJobs : [Job] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblVw.dataSource = self
        tblVw.delegate = self
        tblVw.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchAllJobs()
    }
    
    func fetchAllJobs() {
        self.startLoading()
        ref.child("Jobs").observe(.value) { (snapshot) in
            
            print("Items fetched count", snapshot.childrenCount)
            self.allJobs.removeAll()
            
            for child in snapshot.children {
                if let test = child as? DataSnapshot,
                   let value = test.value as? [String: Any] {
                    
                    if let data = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted) {
                        let decoder = JSONDecoder()
                        if let job = try? decoder.decode(Job.self, from: data) {
                            print(job)
                            self.allJobs.append(job)
                        } else {
                            print("Failed to decode Job")
                            self.stopLoading()
                        }
                    } else {
                        print("Failed to serialize data")
                        self.stopLoading()
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.tblVw.reloadData()
                self.stopLoading()

            }
        } withCancel: { error in
            print(error.localizedDescription)
            self.stopLoading()
        }
    }


    @IBAction func addNewJobBtnPressed(_ sender: Any) {
        pushVC(nameOfVC: CreateJobVC.id, storyboardName:.Basic)
    }
    
    @IBAction func settingBtnPressed(_ sender: Any) {
        pushVC(nameOfVC: SettingsVC.id, storyboardName: .Basic)
    }
}
extension AllJobsVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allJobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.indexNoLbl.text = "\(indexPath.row + 1). "
        let job = allJobs[indexPath.row]
        cell.jobDescLbl.text = "Company: \(job.companyName)"
        cell.jobTitleLbl.text = "Job: \(job.jobTitle)"
        cell.amountLbl.text = job.jobAmount
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedJob = allJobs[indexPath.row]
        let detailVC = UIStoryboard(name: "Basic", bundle: nil).instantiateViewController(withIdentifier: "DetailOfJobVC") as! DetailOfJobVC
        
        detailVC.jobTitle = selectedJob.jobTitle
        detailVC.jobLocation = selectedJob.jobLocation
        detailVC.companyName = selectedJob.companyName
        detailVC.jobTiming = selectedJob.jobTiming
        detailVC.jobDescription = selectedJob.jobDescription
        detailVC.jobAmount = selectedJob.jobAmount
        detailVC.companyEmail = selectedJob.companyEmail
        detailVC.companyPhone = selectedJob.companyPhone
        
        navigationController?.pushViewController(detailVC, animated: true)
    }

}
