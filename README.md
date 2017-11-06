# TJBioAuthentication
> Apple bio metric authentication for touchID and faceID

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)




## Features

- [x] FaceID authentication
- [x] TouchID authentication
- [x] Passcode authentication
- [x] Batter error handeling


## Requirements

- iOS 10.0+
- Xcode 9.0

## Installation

#### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```



To integrate TJBioAuthentication into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'TJBioAuthentication'
end
```

Then, run the following command:

```bash
$ pod install
```

#### Manually
1. Download and drop ```TJAuthErrors.swift```,```TJBioAuthenticator.swift``` and ```TJDefaultMessages.swift``` in your project.
2. Congratulations!


## Usage

**Note:** - To use faceID you need to add following lines in your info.plist
```swift
<key>NSFaceIDUsageDescription</key>
<string>$(PRODUCT_NAME) requires Face ID permission to authenticate using Face recognition.</string>
```

### Check biometric authentication is available or not. 

```swift
if TJBioAuthenticator.shared.isBiometricAuthenticationAvailable(){
        // Bio metric is available, write your code here
}
```

### Check faceID authentication is available or not. 

```swift
if TJBioAuthenticator.shared.isFaceIDAvailable(){
      // FaceID is available, write your code here
}
```

### Authentication using bioMetric.

```swift
TJBioAuthenticator.shared.authenticateUserWithBioMetrics(success: {
            // Biometric Authentication success
        }) { (error) in
            // Biometric Authentication unsuccessful
        }
```

### Authentication using passcode.

```swift
TJBioAuthenticator.shared.authenticateUserWithPasscode(success: {
            // Biometric Authentication success
        }) { (error) in
            // Biometric Authentication unsuccessful
        }
```

## Contribute

We would love you for the contribution to **TJBioAuthentication**, check the ``LICENSE`` file for more info.

## Author

Tejas Ardeshna – [@tejas_ardeshna](https://twitter.com/tejas_ardeshna) – tejasardeshna@gmail.com

Distributed under the MIT license. See ``LICENSE`` for more information.


[swift-image]:https://img.shields.io/badge/swift-3.2-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: https://github.com/tejas-ardeshna/TJProfileImage/blob/master/LICENSE.md
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
