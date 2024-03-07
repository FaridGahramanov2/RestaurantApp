//
//  DataMenu.swift
//  RestaurantAppLesson
//
//  Created by Farid Gahramanov on 18.08.22.
//

import Foundation

struct MenuProducts: Codable {
    let icon: String
    let name: String
    let options: [MainDetail]
}

struct MainDetail: Codable {
    let id: Float
    let icon: String
    let name: String
    let description: String
    let price: Float
    var quanity: Float
}

struct BasketModel: Codable {
    let id: Float
    let icon: String
    let name: String
    let pricee: Float
    var amount: Float
}
