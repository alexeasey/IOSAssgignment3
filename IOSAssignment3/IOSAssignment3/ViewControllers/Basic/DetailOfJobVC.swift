//
//  DetailOfJobVC.swift
//  IOSAssignment3
//
//  Created by M Taimoor on 12/05/2024.
//

import UIKit

class DetailOfJobVC: UIViewController {

    
    @IBOutlet weak var jobTitleLbl: UILabel!
    @IBOutlet weak var jobLocationLbl: UILabel!
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var jobTimingLbl: UILabel!
    @IBOutlet weak var jobDescriptionLbl: UILabel!
    @IBOutlet weak var jobAmountLbl: UILabel!
    @IBOutlet weak var companyEmailLbl: UILabel!
    @IBOutlet weak var companyPhoneLbl: UILabel!
    
    
    
    var jobTitle: String?
    var jobLocation: String?
    var companyName: String?
    var jobTiming: String?
    var jobDescription: String?
    var jobAmount: String?
    var companyEmail: String?
    var companyPhone: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("I am DetailOfJobVC")
        configureLabels()
    }
    
    func configureLabels() {
        jobTitleLbl.text = jobTitle
        jobLocationLbl.text = jobLocation
        companyNameLbl.text = companyName
        jobTimingLbl.text = jobTiming
        jobDescriptionLbl.text = jobDescription
        jobAmountLbl.text = jobAmount
        companyEmailLbl.text = companyEmail
        companyPhoneLbl.text = companyPhone
    }
}


