//
//  FirstExampleViewController.swift
//  PlaceIt
//
//  Created by Oliver Letterer on 02.08.14.
//  Copyright (c) 2014 Sparrow-Labs. All rights reserved.
//

import UIKit

class FirstExampleViewController: UIViewController {
    var blueView: UIView! = nil
    var greenView: UIView! = nil
    var titleLabel: UILabel! = nil
    var subtitleLabel: UILabel! = nil

    override func loadView() {
        super.loadView()

        blueView = UIView(frame: CGRectZero)
        blueView.backgroundColor = UIColor.blueColor()
        view.addSubview(blueView);

        greenView = UIView(frame: CGRectZero)
        greenView.backgroundColor = UIColor.greenColor()
        view.addSubview(greenView)

        titleLabel = UILabel()
        titleLabel.text = "Hello Playground"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.boldSystemFontOfSize(24)
        view.addSubview(titleLabel)

        subtitleLabel = UILabel()
        subtitleLabel.text = "This is a very long subtitle lorem ipsum text"
        subtitleLabel.textColor = UIColor.whiteColor()
        subtitleLabel.font = UIFont.boldSystemFontOfSize(19)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .Center
        view.addSubview(subtitleLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.redColor()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let buttonHeight: CGFloat = 66.0
        let visibleBounds = view.bounds.inset(UIEdgeInsetsMake(44 + 20, 0, buttonHeight, 0))

        view
            .layoutSubview(blueView,
                atPosition: LayoutPosition(horizontal: .Left(0.0), vertical: .Bottom(0.0)),
                withSize: CGSize(width: CGRectGetWidth(view.bounds) / 2.0, height: buttonHeight))
            .layoutSubview(greenView,
                atPosition: LayoutPosition(horizontal: .Right(0.0), vertical: .Bottom(0.0)),
                withSize: CGSize(width: CGRectGetWidth(view.bounds) / 2.0, height: buttonHeight))
            .layoutSubviews([titleLabel, subtitleLabel],
                atPosition: LayoutPosition(horizontal: .Center, vertical: .Center),
                direction: .TopToBottom,
                inRect: visibleBounds)
    }
}
