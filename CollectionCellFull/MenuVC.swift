//
//  MenuVC.swift
//  RestaurantAppLesson
//
//  Created by Farid Gahramanov on 18.08.22.
//

import UIKit

class MenuVC: UIViewController {
    
    var menuProd: [MenuProducts] = [
    MenuProducts(icon: "soup", name: "Soup", options: [
        MainDetail(id: 1, icon: "merci_soup", name: "Merci", description: "Lentil soup is a soup with lentils as its main ingredient; it may be vegetarian or include meat, and may use brown, red, yellow, green or black lentils, with or without the husk. Dehulled yellow and red lentils disintegrate in cooking, making a thick soup.", price: 13, quanity: 30),
        MainDetail(id: 2, icon: "chiken_soup", name: "Chicken Soup", description: "Chicken soup is a soup made from chicken, simmered in water, usually with various other ingredients. The classic chicken soup consists of a clear chicken broth, often with pieces of chicken or vegetables; common additions are pasta, noodles, dumplings, or grains such as rice and barley.", price: 10, quanity: 20),
        MainDetail(id: 3, icon: "mushroom_soup", name: "Mushroom Soup", description: "Cream of mushroom soup is a simple type of soup where a basic roux is thinned with cream or milk and then mushrooms and/or mushroom broth are added. It is well known in North America as a common type of condensed canned soup. Cream of mushroom soup is often used as a base ingredient in casseroles and comfort foods.", price: 11, quanity: 20),
    ]),
    MenuProducts(icon: "pizza", name: "Pizza", options: [
        MainDetail(id: 4, icon: "pizza_1", name: "Peperoni", description: "Pepperoni is an American variety of spicy salami made from cured pork and beef seasoned with paprika or other chili pepper. Prior to cooking, pepperoni is characteristically soft, slightly smoky, and bright red. Thinly sliced pepperoni is one of the most popular pizza toppings in American pizzerias.", price: 19, quanity: 20),
        MainDetail(id: 5, icon: "pizza_2", name: "Vegetarian", description: "It’s fresh and full of flavor, featuring cherry tomatoes, artichoke, bell pepper, olives, red onion and some hidden (and optional) baby spinach. You’ll find a base of rich tomato sauce and golden, bubbling mozzarella underneath, of course.", price: 23, quanity: 20),
        MainDetail(id: 6, icon: "pizza_3", name: "Margherita", description: "Pizza margherita, as the Italians call it, is a simple pizza hailing from Naples. When done right, margherita pizza features a bubbly crust, crushed San Marzano tomato sauce, fresh mozzarella and basil, a drizzle of olive oil, and a sprinkle of salt. That is all", price: 15, quanity: 20),
    ]),
    MenuProducts(icon: "spaghetti", name: "Pasta", options: [
        MainDetail(id: 7, icon: "pasta_1", name: "Tagliatelle", description: "Tagliatelle is a long, ribbon-shaped pasta that's similar to fettuccine. In fact, some people say they’re actually the exact same thing! This pasta is usually known as fettuccine in Rome and Southern Italy, while Northern Italians typically refer to it as tagliatelle. Often server with a rich meat sauce, like bolognese, it's also delicious with fresh vegetables.", price: 14, quanity: 20),
        MainDetail(id: 8, icon: "pasta_2", name: "Macaroni", description: "Macaroni is a tubular-shaped pasta that comes in different lengths and sizes, but is commonly cut short. This versatile pasta shape is used in a wide variety of dishes, the most popular being macaroni and cheese.", price: 11, quanity: 30),
        MainDetail(id: 9, icon: "pasta_3", name: "Farfalle", description: "Also known as bow-tie or butterfly pasta, farfalle is perfect for cream-based sauces or in pasta salads. This pasta is said to date back to the 1500s, originating in Northern Italy.", price: 16, quanity: 40),
    ]),
    MenuProducts(icon: "burger", name: "Burgers", options: [
        MainDetail(id: 10, icon: "burger_1", name: "Classic", description: "Classic burger is an American burger variety with origins in Corinth, Mississippi. Despite its unusual name, it is not made with slugs, but gets its name from the Depression-era practice of combining ground meat with fillers such as potato flour or soybeans.", price: 15, quanity: 40),
        MainDetail(id: 11, icon: "burger_2", name: "Slider", description: "Although many people might think so, the famous slider is not just a small hamburger, but a very specific food item. First of all, a small ball of ground meat is smashed on a well-oiled griddle until very thin, accompanied by onions, which fry into the meat during the cooking process.", price: 22, quanity: 10),
        MainDetail(id: 12, icon: "burger_3", name: "Mexican Burger", description: "Mexican burger is New Mexico’s variation of the classic burger, made with green New Mexico chile-topped beef patty inside a burger bun. A slice of melted American cheese on top of the patty is mandatory. The dish has been popular at least since the 1950s, and nowadays it is practically a symbol of New Mexico.", price: 16, quanity: 20),
    ]),
    MenuProducts(icon: "coffee-glass", name: "Drinks", options: [
        MainDetail(id: 13, icon: "drink_1", name: "Water", description: "Bottle of Water", price: 3, quanity: 20),
        MainDetail(id: 14, icon: "drink_2", name: "Soda", description: "Coca-Cola, Fanta, Sprite", price: 4, quanity: 30),
        MainDetail(id: 15, icon: "drink_3", name: "Ayran", description: "Cup of Ayran", price: 1.5, quanity: 10),
    ]),
    MenuProducts(icon: "cocktail", name: "Cocktails", options: [
        MainDetail(id: 16, icon: "cocktail_1", name: "Long Island Iced Tea", description: "The drink combines four spirits: light rum, vodka, tequila, and gin. It’s the ultimate cocktail for indecisive imbibers. Love it or hate it, this saccharine drink is back.", price: 15, quanity: 12),
        MainDetail(id: 17, icon: "cocktail_2", name: "Pina Colada", description: "Another nod to the tropical cocktails resurgence, this 1970s-era Puerto Rican slushie pleasure is made with white rum, coconut cream, and pineapple juice. It jumped up seven spots since last year.", price: 13, quanity: 15),
        MainDetail(id: 18, icon: "cocktail_3", name: "Bloody Mary", description: "The Bloody Mary is as much an experience as a drink. The brunch-time staple is best enjoyed with a house mix of tomato juice, vodka, and spices. And, if it’s your thing, an array of garnishes — from celery and olives to bacon to entire cheeseburgers — are known to make appearances.", price: 12, quanity: 45),
    ]),
    ]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .colorOne
        view.delegate = self
        view.dataSource = self
        view.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.description())
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .colorOne
        setUpConstrait()
    }
    
    func setUpConstrait() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
        
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension MenuVC: CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuProd.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.description(), for: indexPath) as? CollectionCell {
            cell.item = menuProd[indexPath.item]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = BasketController()
        vc.db.menu = menuProd[indexPath.row].options
        show(vc, sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
