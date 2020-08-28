//
//  FileStruct.swift
//  testeAuroraBoreal
//
//  Created by Alanis Lima Santa Clara on 27/08/20.
//  Copyright © 2020 Alanis Lima Santa Clara. All rights reserved.
//

import Foundation


// essa eh a raiz do jason, a estrutura principal

struct Welcome: Codable {
    let images: [String: ImageAurora]
}

struct ImageAurora: Codable {
    let id, name, imageDescription: String
    let cache: Int
    let url: String
    let category: Category

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageDescription = "description"
        case cache, url, category
    }
}

//Enumeraçao, dizendo que tem esse itens
enum Category: String, Codable {
    case cam = "cam"
    case chart = "chart"
    case satellite = "satellite"
}
