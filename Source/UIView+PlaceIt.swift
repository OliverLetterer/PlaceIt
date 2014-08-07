//
//  UIView+PlaceIt.swift
//  PlaceIt
//
//  Created by Oliver Letterer on 02.08.14.
//  Copyright (c) 2014 Oliver Letterer. All rights reserved.
//

import UIKit

public enum HorizontalPosition {
    case Left(CGFloat)
    case Center
    case Right(CGFloat)
    case Aside(UIView, CGFloat)
    case EdgeToEdge(CGFloat)
}

public enum VerticalPosition {
    case Top(CGFloat)
    case Center
    case Bottom(CGFloat)
    case Below(UIView, CGFloat)
    case EdgeToEdge(CGFloat)
}

public enum LayoutDirection {
    case TopToBottom
    case LeftToRight
}

public typealias Position = (horizontal: HorizontalPosition, vertical: VerticalPosition)

public extension UIView {
    func layoutSubview(subview: UIView, atPosition position: Position) -> Self {
        return layoutSubview(subview, atPosition: position, withSize: subview.sizeThatFits(bounds.size))
    }

    func layoutSubview(subview: UIView, atPosition position: Position, withSize size: CGSize) -> Self {
        return layoutSubview(subview, atPosition: position, withSize: size, inRect: bounds)
    }

    func layoutSubview(subview: UIView, atPosition position: Position, inRect rect: CGRect) -> Self {
        return layoutSubview(subview, atPosition: position, withSize: subview.sizeThatFits(rect.size), inRect: rect)
    }

    func layoutSubview(subview: UIView, atPosition position: Position, withSize size: CGSize, inRect layoutRect:CGRect) -> Self {
        assert(subview.isDescendantOfView(self), "subview is no descendant of self");

        var frame = CGRect(origin: CGPointZero, size: size)

        switch position.horizontal {
        case .Left(let inset):
            frame.origin.x = CGRectGetMinX(layoutRect) + inset
        case .Center:
            frame.origin.x = CGRectGetMidX(layoutRect) - size.width / 2.0
        case .Right(let inset):
            frame.origin.x = CGRectGetMaxX(layoutRect) - size.width - inset
        case .Aside(let view, let offset):
            frame.origin.x = CGRectGetMaxX(view.frame) + offset
        case .EdgeToEdge(let inset):
            frame.origin.x = CGRectGetMinX(layoutRect) + inset
            frame.size.width = CGRectGetWidth(layoutRect) - 2.0 * inset
        }

        switch position.vertical {
        case .Top(let inset):
            frame.origin.y = CGRectGetMinY(layoutRect) + inset
        case .Center:
            frame.origin.y = CGRectGetMidY(layoutRect) - size.height / 2.0
        case .Bottom(let inset):
            frame.origin.y = CGRectGetMaxY(layoutRect) - size.height - inset
        case .Below(let view, let offset):
            frame.origin.y = CGRectGetMaxY(view.frame) + offset
        case .EdgeToEdge(let inset):
            frame.origin.y = CGRectGetMinY(layoutRect) + inset
            frame.size.height = CGRectGetHeight(layoutRect) - 2.0 * inset
        }

        subview.frame = frame
        return self
    }

    func layoutSubviews(subviews: [UIView], atPosition position: Position, direction: LayoutDirection) -> Self {
        return layoutSubviews(subviews, atPosition: position, direction: direction, inRect: bounds)
    }

    func layoutSubviews(subviews: [UIView], atPosition position: Position, direction: LayoutDirection, inRect rect:CGRect) -> Self {
        return layoutSubviews(subviews, atPosition: position, direction: direction, inRect: rect, interItemSpacing: 0)
    }

    func layoutSubviews(subviews: [UIView], atPosition position: Position, direction: LayoutDirection, inRect rect:CGRect, interItemSpacing: CGFloat) -> Self {
        assert(subviews.count > 0, "no subviews")

        let reduceHeightOrWidth = { (dimension: CGFloat, view: UIView) -> CGFloat in
            switch direction {
            case .TopToBottom:
                return dimension + view.sizeThatFits(rect.size).height
            case .LeftToRight:
                return dimension + view.sizeThatFits(rect.size).width
            }
        }

        let overallHeightOrWidth = subviews.reduce(CGFloat(0.0), combine: reduceHeightOrWidth) + interItemSpacing * (CGFloat(subviews.count) - 1)

        switch direction {
        case .TopToBottom:
            var topOffset: CGFloat = 0.0

            switch position.vertical {
            case .Top(let inset):
                topOffset = CGRectGetMinY(rect) + inset
            case .Center:
                topOffset = CGRectGetMidY(rect) - overallHeightOrWidth / 2.0
            case .Bottom(let inset):
                topOffset = CGRectGetMaxY(rect) - overallHeightOrWidth - inset
            case .Below(let view, let offset):
                topOffset = CGRectGetMaxY(view.frame) + offset
            case .EdgeToEdge(let inset):
                topOffset = CGRectGetMinY(rect) + inset
            }

            var globalFrame = rect
            globalFrame.origin.y = 0

            for (index, view) in enumerate(subviews) {
                if index == 0 {
                    layoutSubview(view,
                        atPosition: (horizontal: position.horizontal, vertical: .Top(topOffset)),
                        withSize: view.sizeThatFits(rect.size),
                        inRect: globalFrame)
                } else {
                    layoutSubview(view,
                        atPosition: (horizontal: position.horizontal, vertical: .Below(subviews[index - 1], interItemSpacing)),
                        withSize: view.sizeThatFits(rect.size),
                        inRect: globalFrame)
                }
            }
        case .LeftToRight:
            var leftOffset: CGFloat = 0.0

            switch position.horizontal {
            case .Left(let inset):
                leftOffset = CGRectGetMinX(rect) + inset
            case .Center:
                leftOffset = CGRectGetMidX(rect) - overallHeightOrWidth / 2.0
            case .Right(let inset):
                leftOffset = CGRectGetMaxX(rect) - overallHeightOrWidth - inset
            case .Aside(let view, let offset):
                leftOffset = CGRectGetMaxX(view.frame) + offset
            case .EdgeToEdge(let inset):
                leftOffset = CGRectGetMinX(rect) + inset
            }

            var globalFrame = rect
            globalFrame.origin.x = 0

            for (index, view) in enumerate(subviews) {
                if index == 0 {
                    layoutSubview(view,
                        atPosition: (horizontal: .Left(leftOffset), vertical: position.vertical),
                        withSize: view.sizeThatFits(rect.size),
                        inRect: globalFrame)
                } else {
                    layoutSubview(view,
                        atPosition: (horizontal: .Aside(subviews[index - 1], interItemSpacing), vertical: position.vertical),
                        withSize: view.sizeThatFits(rect.size),
                        inRect: globalFrame)
                }
            }
        }
        
        return self
    }
}
