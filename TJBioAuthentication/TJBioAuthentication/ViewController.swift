//
//  ViewController.swift
//  TJBioAuthentication
//
//  Created by Tejas Ardeshna on 03/11/17.
//  Copyright © 2017 Tejas Ardeshna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnPasswordLogin: UIButton!
    @IBOutlet weak var btnBiometricLogin: UIButton!
    
    @IBAction func btnBiometricLoginClicked(_ sender: Any) {
        
        TJBioAuthenticator.shared.authenticateUserWithBiometrics(success: {
            // Biometric Authentication success
            self.showSuccessAlert()
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
    
    func executePasscodeAuthentication()
    {
        TJBioAuthenticator.shared.authenticateUserWithPasscode(success: {
            self.showSuccessAlert()
        }) { (error) in
            self.presentAlert(withTitle: "Error", message: error.getMessage())
        }
    }
}

extension ViewController
{
    func showSuccessAlert() {
        DispatchQueue.main.async {
            self.presentAlert(withTitle: "Success", message: "Login successful")
        }
    }
}




