//
//  CGRect+PlaceIt.swift
//  PlaceIt
//
//  Created by Oliver Letterer on 02.08.14.
//  Copyright (c) 2014 Oliver Letterer. All rights reserved.
//

import UIKit

public extension CGRect {
    func divide(amount: CGFloat, edge: CGRectEdge) -> (first: CGRect, second: CGRect) {
        var first = CGRect(), second = CGRect()
        CGRectDivide(self, &first, &second, amount, edge)

        return (first, second)
    }

    func inset(inset: UIEdgeInsets) -> CGRect {
        return UIEdgeInsetsInsetRect(self, inset)
    }
}
