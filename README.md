# PlaceIt

[![CI Status](http://img.shields.io/travis/Oliver Letterer/PlaceIt.svg?style=flat)](https://travis-ci.org/Oliver Letterer/PlaceIt)
[![Version](https://img.shields.io/cocoapods/v/PlaceIt.svg?style=flat)](http://cocoadocs.org/docsets/PlaceIt)
[![License](https://img.shields.io/cocoapods/l/PlaceIt.svg?style=flat)](http://cocoadocs.org/docsets/PlaceIt)
[![Platform](https://img.shields.io/cocoapods/p/PlaceIt.svg?style=flat)](http://cocoadocs.org/docsets/PlaceIt)

## Usage

PlaceIt let's You place Your UIView subclasses at positions:

* position a view at the bottom center:
``` swift
view.layoutSubview(blueView,
    atPosition: Position(horizontal: .Center, vertical: .Bottom(0)))
```

* bottom right with padding
``` swift
view.layoutSubview(blueView,
    atPosition: Position(horizontal: .Right(14), vertical: .Bottom(14)))
```

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

* split view in two left and right sections
``` swift
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

## Installation

PlaceIt is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "PlaceIt"

## Author

Oliver Letterer, oliver.letterer@gmail.com

## License

PlaceIt is available under the MIT license. See the LICENSE file for more info.
