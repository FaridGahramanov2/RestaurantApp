//
//  Baket.swift
//  RestaurantAppLesson
//
//  Created by Farid Gahramanov on 18.08.22.
//

import UIKit

class Bridge {
    static let shared = Bridge()
    var menu: [MainDetail] = []
    var baskets: [BasketModel] = []
}

class BasketController: UIViewController {
    
    let db = Bridge.shared
    
    lazy var topTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .colorOne
        view.delegate = self
        view.dataSource = self
        view.separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 20)
        view.register(BasketCell.self, forCellReuseIdentifier: BasketCell.description())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delaysContentTouches = false
        return view
    }()
    
    let sumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .colorSix
        label.text = "0.0"
        label.font = UIFont(name: "AvenirNext-Regular", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .colorSix
        label.text = "Your Tottal Is:"
        label.font = UIFont(name: "AvenirNext-Regular", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var bottomTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .colorOne
        view.delegate = self
        view.dataSource = self
        view.separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 20)
        view.register(CustomCell.self, forCellReuseIdentifier: CustomCell.description())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delaysContentTouches = false
        return view
    }()
    
    let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorFour
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .colorOne
        
        view.addSubview(footerView)
        footerView.addSubview(totalLabel)
        footerView.addSubview(sumLabel)
        view.addSubview(topTableView)
        view.addSubview(bottomTableView)
        
        NSLayoutConstraint.activate([
        
            
            topTableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.4),
            
            totalLabel.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            totalLabel.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 16),
            totalLabel.heightAnchor.constraint(equalToConstant: 100),
            
            sumLabel.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            sumLabel.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -16),
            sumLabel.heightAnchor.constraint(equalToConstant: 100),

            bottomTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomTableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.4),
            
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.topAnchor.constraint(equalTo: topTableView.bottomAnchor),
            footerView.bottomAnchor.constraint(equalTo: bottomTableView.topAnchor),
        ])
        calculatePrice()
    }
    
    func calculatePrice() {
        var sumOfProducts = Float(0.0)
        
        for item in db.baskets {
            sumOfProducts += item.pricee * item.amount
        }
        sumLabel.text = "\(sumOfProducts)"
    }
}

extension BasketController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == topTableView {
            return db.baskets.count
        } else if tableView == bottomTableView {
            return db.menu.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == topTableView {
            if let cell = tableView.dequeueReusableCell(withIdentifier: BasketCell.description(), for: indexPath) as? BasketCell {
                cell.item = db.baskets[indexPath.row]
                return cell
            }
        } else if tableView == bottomTableView {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.description(), for: indexPath) as? CustomCell {
                cell.item = db.menu[indexPath.row]
                cell.addButton.tag = indexPath.row
                cell.addButton.addTarget(self, action: #selector(didTapAdd(sender:)), for: .touchUpInside)
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            db.baskets.remove(at: indexPath.row)
            self.calculatePrice()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @objc private func didTapAdd(sender: UIButton) {
        
        let bsketItems = db.baskets
        let menuItem = db.menu[sender.tag]
        var isHave = false
        
        if db.baskets.count > 0 {
            for i in 0...bsketItems.count - 1 {
                
                if db.baskets[i].id == menuItem.id {
                    
                    db.baskets[i].amount += 1
                    isHave.toggle()
                }
            }
        }
        
        if !isHave {
            let basketItem = BasketModel(id: menuItem.id, icon: menuItem.icon, name: menuItem.name, pricee: menuItem.price, amount: 1)
            db.baskets.append(basketItem)
        }
        calculatePrice()
        topTableView.reloadData()
    }
}
