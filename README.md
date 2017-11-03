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
You can use [CocoaPods](http://cocoapods.org/) to install `TJBioAuthentication` by adding it to your `Podfile`:

```ruby
platform :ios, '10.0'
use_frameworks!
pod 'TJBioAuthentication'
```

To get the full benefits import `TJBioAuthentication` wherever you import UIKit

``` swift
import UIKit
import TJBioAuthentication
```

#### Manually
1. Download and drop ```TJAuthErrors.swift```,```TJBioAuthenticator.swift``` and ```TJDefaultMessages.swift``` in your project.
2. Congratulations!



## Contribute

We would love you for the contribution to **TJBioAuthentication**, check the ``LICENSE`` file for more info.

## Author

Tejas Ardeshna – [@tejas_ardeshna](https://twitter.com/tejas_ardeshna) – tejasardeshna@gmail.com

Distributed under the MIT license. See ``LICENSE`` for more information.


[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: https://github.com/tejas-ardeshna/TJProfileImage/blob/master/LICENSE.md
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
