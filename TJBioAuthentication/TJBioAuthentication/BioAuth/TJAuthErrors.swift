//
//  TJAuthErrors.swift
//  BioAuth
//
//  Created by Tejas Ardeshna on 03/11/17.
//  Copyright © 2017 Tejas Ardeshna.
//
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

import Foundation
import LocalAuthentication

// Authentication Errors
public enum TJAuthErrors {
    
    case appCancel, failed, userCancel, userFallback, systemCancel, passcodeNotSet, biometryNotEnrolled, biometryLockedout, invalidContext , biometryNotAvailable,other
    
    public static func errorType(_ error: LAError) -> TJAuthErrors {
        switch Int32(error.errorCode) {
            
        case kLAErrorAuthenticationFailed:
            return failed
        case kLAErrorUserCancel:
            return userCancel
        case kLAErrorUserFallback:
            return userFallback
        case kLAErrorSystemCancel:
            return systemCancel
        case kLAErrorPasscodeNotSet:
            return passcodeNotSet
        case kLAErrorBiometryNotEnrolled:
            return biometryNotEnrolled
        case kLAErrorBiometryLockout:
            return biometryLockedout
        case kLAErrorAppCancel:
            return appCancel
        case kLAErrorInvalidContext:
            return invalidContext
        case kLAErrorBiometryNotAvailable:
            return biometryNotAvailable
        default:
           return other
        }
    }
    
    // get error message based on type
    public func getMessage() -> String {
        switch self {
        case .appCancel:
            return "Authentication was cancelled by application."
        case .failed:
            return "The user failed to provide valid credentials."
        case .invalidContext:
            return "The context is invalid."
        case .userFallback:
            return "The user chose to use the fallback."
        case .userCancel:
            return "The user did cancel."
        case .passcodeNotSet:
            return "Passcode is not set on the device."
        case .systemCancel:
            return "Authentication was cancelled by the system."
        case .biometryNotEnrolled:
            return "Biometric is not enrolled on the device."
        case .biometryLockedout:
            return "Too many failed attempts."
        case .biometryNotAvailable:
            return "Biometric is not available on the device."
        case .other:
            return "Did not find error code on LAError object."
        }
    }
}


