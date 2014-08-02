//
//  UIEdgeInsets+PlaceIt.swift
//  PlaceIt
//
//  Created by Oliver Letterer on 02.08.14.
//  Copyright (c) 2014 Oliver Letterer. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    init(top: CGFloat) {
        self.init(top: top, left: 0.0, bottom: 0.0, right: 0.0)
    }

    init(left: CGFloat) {
        self.init(top: 0.0, left: left, bottom: 0.0, right: 0.0)
    }

    init(bottom: CGFloat) {
        self.init(top: 0.0, left: 0.0, bottom: bottom, right: 0.0)
    }

    init(right: CGFloat) {
        self.init(top: 0.0, left: 0.0, bottom: 0.0, right: right)
    }
}
