# PlaceIt

[![CI Status](http://img.shields.io/travis/Oliver Letterer/PlaceIt.svg?style=flat)](https://travis-ci.org/Oliver Letterer/PlaceIt)
[![Version](https://img.shields.io/cocoapods/v/PlaceIt.svg?style=flat)](http://cocoadocs.org/docsets/PlaceIt)
[![License](https://img.shields.io/cocoapods/l/PlaceIt.svg?style=flat)](http://cocoadocs.org/docsets/PlaceIt)
[![Platform](https://img.shields.io/cocoapods/p/PlaceIt.svg?style=flat)](http://cocoadocs.org/docsets/PlaceIt)

## Usage

PlaceIt let's You place Your UIView subclasses at positions:

``` swift
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let buttonHeight: CGFloat = 66.0
        let visibleBounds = UIEdgeInsetsInsetRect(view.bounds, UIEdgeInsetsMake(44 + 20, 0, buttonHeight, 0))

        view.layoutSubview(blueView,
            atPosition: LayoutPosition(horizontal: .Left(0.0), vertical: .Bottom(0.0)),
            withSize: CGSize(width: CGRectGetWidth(view.bounds) / 2.0, height: buttonHeight))
    }
```

## Installation

PlaceIt is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "PlaceIt"

## Author

Oliver Letterer, oliver.letterer@gmail.com

## License

PlaceIt is available under the MIT license. See the LICENSE file for more info.
