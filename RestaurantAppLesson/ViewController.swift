//
//  ViewController.swift
//  RestaurantAppLesson
//
//  Created by Farid Gahramanov on 18.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    let introLabel: UILabel = {
        let label = UILabel()
        label.textColor = .colorSix
        label.text = "Welcome to Cico"
        label.font = UIFont(name: "AvenirNext-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bodyImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "mainpage_img")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var buttonLogin: UIButton = {
         let button = UIButton()
         button.backgroundColor = .colorTwo
         button.setTitle("Menu", for: .normal)
         button.titleLabel?.font = UIFont(name: "PingFangSC-Light", size: 18)
         button.setTitleColor(.colorSix, for: .normal)
         button.layer.cornerRadius = 10
         button.addTarget(self, action: #selector(getToVC), for: .touchUpInside)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    
    lazy var buttonWaiter: UIButton = {
         let button = UIButton()
         button.backgroundColor = .colorTwo
         button.setTitle("Call Waiter", for: .normal)
         button.titleLabel?.font = UIFont(name: "PingFangSC-Light", size: 18)
         button.setTitleColor(.colorSix, for: .normal)
         button.layer.cornerRadius = 10
         button.addTarget(self, action: #selector(AlertShowUp), for: .touchUpInside)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .colorOne
        setUpConfig()
    }
    
    func setUpConfig() {
        view.addSubview(introLabel)
        view.addSubview(bodyImage)
        view.addSubview(buttonLogin)
        view.addSubview(buttonWaiter)
        
        NSLayoutConstraint.activate([
            
            introLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            introLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            bodyImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bodyImage.topAnchor.constraint(equalTo: introLabel.bottomAnchor, constant: 80),
            bodyImage.heightAnchor.constraint(equalToConstant: 200),
            bodyImage.widthAnchor.constraint(equalToConstant: 200),
            
            buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLogin.topAnchor.constraint(equalTo: bodyImage.bottomAnchor, constant: 100),
            buttonLogin.heightAnchor.constraint(equalToConstant: 50),
            buttonLogin.widthAnchor.constraint(equalToConstant: 150),
            
            buttonWaiter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonWaiter.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 20),
            buttonWaiter.heightAnchor.constraint(equalToConstant: 50),
            buttonWaiter.widthAnchor.constraint(equalToConstant: 150),
            
        ])
    }
    
    @objc private func getToVC() {
        let vc = MenuVC()
        vc.modalPresentationStyle = .fullScreen
        show(vc, sender: self)
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
    @objc private func AlertShowUp() {
        self.alert(title: "Attention", message: "Your waiter is on his way, Please Wait.")
    }
}
