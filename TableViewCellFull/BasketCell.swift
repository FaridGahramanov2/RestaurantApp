//
//  BasketCell.swift
//  RestaurantAppLesson
//
//  Created by Farid Gahramanov on 18.08.22.
//

import UIKit

class BasketCell: BaseCell {
    
    var item: BasketModel? {
        didSet {
            guard let item = item else { return }
            imageIcon.image = UIImage(named: item.icon)
            nameLabel.text = item.name
            priceLabel.text = "\(item.pricee)"
            amountLabel.text = "\(item.amount)"
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
        label.font = UIFont(name: "AvenirNext-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabel: UILabel = {
       let label = UILabel()
        label.textColor = .colorSix
        label.font = UIFont(name: "AvenirNext-Regular", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   lazy var amountLabel: UILabel = {
       var label = UILabel()
       label.textColor = .colorSix
       label.font = UIFont(name: "AvenirNext-Regular", size: 15)
       label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    override func setupView() {
        super.setupView()
        backgroundColor = .colorOne
        
        contentView.addSubview(imageIcon)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(amountLabel)

        NSLayoutConstraint.activate([
        
            imageIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            imageIcon.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageIcon.heightAnchor.constraint(equalToConstant: 60),
            imageIcon.widthAnchor.constraint(equalToConstant: 60),
            
            nameLabel.leadingAnchor.constraint(equalTo: imageIcon.trailingAnchor, constant: 6),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 35),
            
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            amountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        ])
    }
}
