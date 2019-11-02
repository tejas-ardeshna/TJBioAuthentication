//
//  TJBioAuthenticator.swift
//  BioAuth
//
//  Created by Tejas Ardeshna on 03/11/17.
//  Copyright © 2017 Tejas Ardeshna.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import LocalAuthentication

// success block
public typealias AuthenticationSuccess = (() -> ())

// failure block
public typealias AuthenticationFailure = ((TJAuthErrors) -> ())

public class TJBioAuthenticator: NSObject {

    struct Static {
        static let instance = TJBioAuthenticator()
    }
    
    // this is the Swift way to do singletons
    class open var shared: TJBioAuthenticator
    {
       return Static.instance
    }
}

// MARK:- Public

public extension TJBioAuthenticator {
    
    // checks if Biometric Authentication is available on the device.
    func isBiometricAuthenticationAvailable() -> Bool {
        var error: NSError? = nil
        
        if LAContext().canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            return (error == nil)
        }
        return false
    }
    
    
    // Biometric authentication
    func authenticateUserWithBiometrics(reason: String = "", fallbackTitle: String? = "", cancelTitle: String? = "", success successBlock:@escaping AuthenticationSuccess, failure failureBlock:@escaping AuthenticationFailure) {
        let reasonString = reason.isEmpty ? TJBioAuthenticator.shared.defaultBiometricAuthenticationReason() : reason
        
        let context = LAContext()
        context.localizedFallbackTitle = fallbackTitle
        if #available(iOS 10.0, *) {
            context.localizedCancelTitle = cancelTitle
        } else {
            // Fallback on earlier versions
        }
        
        // evaluate policy
        TJBioAuthenticator.shared.evaluate(policy: LAPolicy.deviceOwnerAuthenticationWithBiometrics, with: context, reason: reasonString, success: successBlock, failure: failureBlock)
    }
    
    // Passcode authentication
    func authenticateUserWithPasscode(reason: String = "", cancelTitle: String? = "", success successBlock:@escaping AuthenticationSuccess, failure failureBlock:@escaping AuthenticationFailure) {
        let reasonString = reason.isEmpty ? TJBioAuthenticator.shared.defaultPasscodeAuthenticationReason() : reason
        
        let context = LAContext()
        if #available(iOS 10.0, *) {
            context.localizedCancelTitle = cancelTitle
        } else {
            // Fallback on earlier versions
        }
        
        // evaluate policy
        TJBioAuthenticator.shared.evaluate(policy: LAPolicy.deviceOwnerAuthentication, with: context, reason: reasonString, success: successBlock, failure: failureBlock)
    }
    
    // checks if Face ID is avaiable on device
    func isFaceIDAvailable() -> Bool {
        if #available(iOS 11.0, *) {
            return (LAContext().biometryType == .faceID)
        }
        return false
    }
}

// MARK:- evaluate policy
extension TJBioAuthenticator {
   
    func evaluate(policy: LAPolicy, with context: LAContext, reason: String, success successBlock:@escaping AuthenticationSuccess, failure failureBlock:@escaping AuthenticationFailure) {
        
        context.evaluatePolicy(policy, localizedReason: reason) { (success, err) in
            if success { successBlock() }
            else {
                let errorType = TJAuthErrors.errorType(err as! LAError)
                failureBlock(errorType)
            }
        }
    }
}

// MARK:- Get default messages
extension TJBioAuthenticator {
    // get default bio authentication reason
    func defaultBiometricAuthenticationReason() -> String {
        return TJDefaultMessages.defaultReasonMessage.rawValue
    }
    
    // get reason after too many failed attempts.
    func defaultPasscodeAuthenticationReason() -> String {
        return TJDefaultMessages.lockoutReasonMessage.rawValue
    }
}
