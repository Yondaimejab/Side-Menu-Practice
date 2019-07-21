//
//  UITableViewCellMenuItem.swift
//  JoelsTest
//
//  Created by Jean Carlos Arnaud on 7/20/19.
//  Copyright © 2019 Joel Alcantara. All rights reserved.
//

import UIKit

class UITableViewCellMenuItem : UITableViewCell {
    let iconImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Sample Text"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        	super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            iconImageView.heightAnchor.constraint(equalTo: heightAnchor, constant: -4),
            iconImageView.widthAnchor.constraint(equalToConstant: 30)
            
            ])
        
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 1),
            iconImageView.heightAnchor.constraint(equalTo: heightAnchor, constant: -2)
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Real deal")
    }
}
