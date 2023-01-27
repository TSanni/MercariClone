//
//  RecommendedItemsModel.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/27/23.
//

import Foundation

struct RecommendedItemModel: Identifiable, Codable {
    let id: String
    var download_url: String = "https://picsum.photos/122"
    let author: String
    
    
}
