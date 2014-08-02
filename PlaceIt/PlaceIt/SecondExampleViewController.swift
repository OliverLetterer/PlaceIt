//
//  SecondExampleViewController.swift
//  PlaceIt
//
//  Created by Oliver Letterer on 02.08.14.
//  Copyright (c) 2014 Sparrow-Labs. All rights reserved.
//

import UIKit

class SecondExampleViewController: UIViewController {
    var blueView: UIView! = nil, greenView: UIView! = nil
    var leftImageView: UIView! = nil, leftLabel: UILabel! = nil
    var rightImageView: UIView! = nil, rightLabel: UILabel! = nil

    override func loadView() {
        super.loadView()

        blueView = UIView(frame: CGRectZero)
        blueView.backgroundColor = UIColor.blueColor()
        view.addSubview(blueView);

        greenView = UIView(frame: CGRectZero)
        greenView.backgroundColor = UIColor.greenColor()
        view.addSubview(greenView)

        let imageDimension: CGFloat = 100

        leftImageView = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: imageDimension, height: imageDimension)))
        leftImageView.backgroundColor = UIColor.whiteColor()
        leftImageView.layer.masksToBounds = true
        leftImageView.layer.cornerRadius = 14
        view.addSubview(leftImageView)

        leftLabel = UILabel()
        leftLabel.text = "Option 1"
        leftLabel.textColor = UIColor.whiteColor()
        leftLabel.font = UIFont.boldSystemFontOfSize(17)
        leftLabel.numberOfLines = 0
        leftLabel.textAlignment = .Center
        view.addSubview(leftLabel)

        rightImageView = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: imageDimension, height: imageDimension)))
        rightImageView.backgroundColor = UIColor.whiteColor()
        rightImageView.layer.masksToBounds = true
        rightImageView.layer.cornerRadius = 14
        view.addSubview(rightImageView)

        rightLabel = UILabel()
        rightLabel.text = "Option 2"
        rightLabel.textColor = UIColor.whiteColor()
        rightLabel.font = UIFont.boldSystemFontOfSize(17)
        rightLabel.numberOfLines = 0
        rightLabel.textAlignment = .Center
        view.addSubview(rightLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.redColor()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let buttonHeight: CGFloat = 66.0
        let (leftFrame, rightFrame) = view.bounds
            .inset(UIEdgeInsets(bottom: buttonHeight))
            .divide(CGRectGetWidth(view.bounds) / 2, edge: .MinXEdge)

        view
            .layoutSubview(blueView,
                atPosition: LayoutPosition(horizontal: .Left(0.0), vertical: .Bottom(0.0)),
                withSize: CGSize(width: CGRectGetWidth(view.bounds) / 2.0, height: buttonHeight))
            .layoutSubview(greenView,
                atPosition: LayoutPosition(horizontal: .Right(0.0), vertical: .Bottom(0.0)),
                withSize: CGSize(width: CGRectGetWidth(view.bounds) / 2.0, height: buttonHeight))
            .layoutSubviews([ leftImageView, leftLabel ],
                atPosition: LayoutPosition(horizontal: .Center, vertical: .Center),
                direction: .TopToBottom,
                inRect: leftFrame,
                interItemSpacing: 7)
            .layoutSubviews([ rightImageView, rightLabel ],
                atPosition: LayoutPosition(horizontal: .Center, vertical: .Center),
                direction: .TopToBottom,
                inRect: rightFrame,
                interItemSpacing: 7)
    }
}
