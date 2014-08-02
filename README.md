# PlaceIt

[![CI Status](http://img.shields.io/travis/Oliver Letterer/PlaceIt.svg?style=flat)](https://travis-ci.org/Oliver Letterer/PlaceIt)
[![Version](https://img.shields.io/cocoapods/v/PlaceIt.svg?style=flat)](http://cocoadocs.org/docsets/PlaceIt)
[![License](https://img.shields.io/cocoapods/l/PlaceIt.svg?style=flat)](http://cocoadocs.org/docsets/PlaceIt)
[![Platform](https://img.shields.io/cocoapods/p/PlaceIt.svg?style=flat)](http://cocoadocs.org/docsets/PlaceIt)

## Usage

Simply place your views ... Swiftly:

* position a view at the bottom center:
``` swift
view.layoutSubview(blueView,
    atPosition: Position(horizontal: .Center, vertical: .Bottom(0)))
```

<img src="https://raw.githubusercontent.com/OliverLetterer/PlaceIt/master/Screenshots/sample-1.png" width=200px>

* bottom right with padding
``` swift
view.layoutSubview(blueView,
    atPosition: Position(horizontal: .Right(14), vertical: .Bottom(14)))
```

<img src="https://raw.githubusercontent.com/OliverLetterer/PlaceIt/master/Screenshots/sample-2.png" width=200px>

* two views at the bottom
``` swift
view
    .layoutSubview(blueView,
        atPosition: Position(horizontal: .Left(0.0), vertical: .Bottom(0.0)),
        withSize: CGSize(width: CGRectGetWidth(view.bounds) / 2.0, height: buttonHeight))
    .layoutSubview(greenView,
        atPosition: Position(horizontal: .Right(0.0), vertical: .Bottom(0.0)),
        withSize: CGSize(width: CGRectGetWidth(view.bounds) / 2.0, height: buttonHeight))
```

<img src="https://raw.githubusercontent.com/OliverLetterer/PlaceIt/master/Screenshots/sample-3.png" width=200px>

* add two labels centered between navigation bar and bottom views
``` swift
let buttonHeight: CGFloat = 66.0
let visibleBounds = view.bounds.inset(UIEdgeInsetsMake(44 + 20, 0, buttonHeight, 0))

view
  .layoutSubviews([titleLabel, subtitleLabel],
    atPosition: Position(horizontal: .Center, vertical: .Center),
    direction: .TopToBottom,
    inRect: visibleBounds)
```

<img src="https://raw.githubusercontent.com/OliverLetterer/PlaceIt/master/Screenshots/sample-4.png" width=200px>

* split view in two left and right sections
``` swift
let buttonHeight: CGFloat = 66.0
let (leftFrame, rightFrame) = view.bounds
  .inset(UIEdgeInsets(bottom: buttonHeight))
  .divide(CGRectGetWidth(view.bounds) / 2, edge: .MinXEdge)

view
  .layoutSubview(blueView,
      atPosition: Position(horizontal: .Left(0.0), vertical: .Bottom(0.0)),
      withSize: CGSize(width: CGRectGetWidth(view.bounds) / 2.0, height: buttonHeight))
  .layoutSubview(greenView,
      atPosition: Position(horizontal: .Right(0.0), vertical: .Bottom(0.0)),
      withSize: CGSize(width: CGRectGetWidth(view.bounds) / 2.0, height: buttonHeight))
  .layoutSubviews([ leftImageView, leftLabel ],
      atPosition: Position(horizontal: .Center, vertical: .Center),
      direction: .TopToBottom,
      inRect: leftFrame,
      interItemSpacing: 7)
  .layoutSubviews([ rightImageView, rightLabel ],
      atPosition: Position(horizontal: .Center, vertical: .Center),
      direction: .TopToBottom,
      inRect: rightFrame,
      interItemSpacing: 7)
```

<img src="https://raw.githubusercontent.com/OliverLetterer/PlaceIt/master/Screenshots/sample-5.png" width=200px>

## Installation

PlaceIt is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "PlaceIt"

## Author

Oliver Letterer, oliver.letterer@gmail.com

## License

PlaceIt is available under the MIT license. See the LICENSE file for more info.
