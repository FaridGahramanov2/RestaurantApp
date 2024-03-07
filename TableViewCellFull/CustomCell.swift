//
//  CustomCell.swift
//  RestaurantAppLesson
//
//  Created by Farid Gahramanov on 18.08.22.
//

import UIKit

class CustomCell: BaseCell {
    
    var item: MainDetail? {
        didSet {
            guard let item = item else { return }
            imageIcon.image = UIImage(named: item.icon)
            nameLabel.text = item.name
            priceLabel.text = "\(item.price)"
            describtionLabe.text = item.description
        }
    }
    
    let imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .colorSix
        label.font = UIFont(name: "AvenirNext-Regular", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
       let label = UILabel()
        label.textColor = .colorSix
        label.font = UIFont(name: "AvenirNext-Regular", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let describtionLabe: UILabel = {
       let label = UILabel()
        label.textColor = .colorSix
        label.font = UIFont(name: "PingFangSC-SemiBold", size: 8)
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .colorTwo
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 15)
        button.setTitleColor(.colorSix, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func setupView() {
        super.setupView()
        backgroundColor = .colorOne
        contentView.addSubview(imageIcon)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(describtionLabe)
        contentView.addSubview(addButton)
        
        NSLayoutConstraint.activate([
        
            imageIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            imageIcon.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageIcon.heightAnchor.constraint(equalToConstant: 60),
            imageIcon.widthAnchor.constraint(equalToConstant: 60),
            
            nameLabel.leadingAnchor.constraint(equalTo: imageIcon.trailingAnchor, constant: 6),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            
            describtionLabe.leadingAnchor.constraint(equalTo: imageIcon.trailingAnchor, constant: 6),
            describtionLabe.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            describtionLabe.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -10),
            
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            addButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 25),
            addButton.heightAnchor.constraint(equalToConstant: 30),
            addButton.widthAnchor.constraint(equalToConstant: 60),
        
        ])
    }
}
