//
//  ViewController.swift
//  Phone Number Memorizer
//
//  Created by Marvin Sagastume on 10/21/18.
//  Copyright © 2018 Innovaze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterPhoneNumberTextBox: UITextField!
    @IBOutlet weak var savedPhoneNumberLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var messageToUserLabel: UILabel!
    
    @IBAction func confirmNumberButton(_ sender: Any) {
        if let phoneNumber = Int(enterPhoneNumberTextBox.text!) {
            if phoneNumber < 1000000000 || phoneNumber > 9999999999 {
                messageToUserLabel.text = "Please enter a valid phone number"
            } else {
                UserDefaults.standard.set(phoneNumber, forKey: "phone number")
                savedPhoneNumberLabel.text = String(phoneNumber)
                messageToUserLabel.text = "Your number has been saved"
                statusLabel.text = "Your phone number is"
            }
        } else {
            messageToUserLabel.text = "Please enter a valid phone number"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        if let phoneNumber = UserDefaults.standard.object(forKey: "phone number") {
            savedPhoneNumberLabel.text = String(phoneNumber as! Int)
            statusLabel.text = "Your phone number is"
        } else {
            statusLabel.text = "No phone number saved"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
