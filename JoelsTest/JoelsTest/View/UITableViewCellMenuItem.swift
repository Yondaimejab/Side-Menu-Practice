//
//  UITableViewCellMenuItem.swift
//  JoelsTest
//
//  Created by Jean Carlos Arnaud on 7/20/19.
//  Copyright © 2019 Joel Alcantara. All rights reserved.
//

import UIKit
import Anchorage

class UITableViewCellMenuItem : UITableViewCell {
    let iconImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Sample Text"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        	super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(iconImageView)
        addSubview(descriptionLabel)
        iconImageView.centerYAnchor == centerYAnchor
        iconImageView.leadingAnchor == leadingAnchor + 15.0
        iconImageView.widthAnchor == DrawingConstants.imageHeight
        iconImageView.heightAnchor == DrawingConstants.imageHeight
            descriptionLabel.centerYAnchor == centerYAnchor
        descriptionLabel.leftAnchor == iconImageView.rightAnchor + DrawingConstants.spacing
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Real deal")
    }
}

extension UITableViewCellMenuItem : UIScrollViewDelegate {
    struct DrawingConstants {
        static let labelHeight: CGFloat = 20.0
        static let imageHeight: CGFloat = 30.0
        static let spacing: CGFloat = 15.0
    }
    
}
