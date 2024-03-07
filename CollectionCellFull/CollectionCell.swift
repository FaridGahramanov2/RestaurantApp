//
//  CollectionCell.swift
//  RestaurantAppLesson
//
//  Created by Farid Gahramanov on 18.08.22.
//

import UIKit

class CollectionCell: BaseCollectionCell{
    
    var item: MenuProducts? {
        didSet {
            guard let item = item else { return }
            imageView.image = UIImage(named: item.icon)
            foodLabel.text = item.name
        }
    }
    
    let containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .colorTwo
        view.shadow(cornerRadius: 6, offset: CGSize(width: 0, height: 0.2), color: .systemGray3, radius: 3, opacity: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let foodLabel: UILabel = {
       let label = UILabel()
        label.textColor = .colorSix
        label.font = UIFont(name: "AvenirNext-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupView() {
        super.setupView()
        backgroundColor = .colorOne
        
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(foodLabel)
        
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 110),

            foodLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            foodLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
        ])
    }
}

extension UIView {
    
    func shadow(cornerRadius: CGFloat = 4,  offset: CGSize = CGSize(width: -1.1, height: 1.1), color: UIColor = UIColor.black.withAlphaComponent(0.3), radius: CGFloat = 1, opacity: Float = 0.5) {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowOffset = offset
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
    }
}
