//
//  ViewController.swift
//  TJBioAuthentication
//
//  Created by Tejas Ardeshna on 03/11/17.
//  Copyright © 2017 Tejas Ardeshna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnLoginWithBioMetric: UIButton!
    @IBOutlet weak var btnLoginWithPassword: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnBioAuthClicked(_ sender: Any) {
        
        TJBioAuthenticator.shared.authenticateUserWithBioMetrics(success: {
            // Biometric Authentication success
            self.showSucessAlert()
        }) { (error) in
            // Biometric Authentication unsuccessful
            switch error{
            case .biometryLockedout:
                self.executePasscodeAuthentication()
            default:
                self.presentAlert(withTitle: "Error", message: error.getMessage())
                break
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func executePasscodeAuthentication()
    {
        TJBioAuthenticator.shared.authenticateUserWithPasscode(success: {
            self.showSucessAlert()
        }) { (error) in
            self.presentAlert(withTitle: "Error", message: error.getMessage())
        }
    }
}

extension ViewController
{
    func showSucessAlert() {
        self.presentAlert(withTitle: "Success", message: "Login successful")
    }
}




