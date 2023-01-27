//
//  RecommenedViewModel.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/27/23.
//

import Foundation

class RecommendedViewMdel: ObservableObject {
    @Published var recommendedItems: [RecommendedItemModel] = []
    @Published var limitedTimeItems: [LimitedTimeItemsModel] = []
    
    
    init() {
        getImages()
    }
    
    func getImages() {
        guard let url = URL(string: "https://picsum.photos/v2/list") else { fatalError("Error: Invalid URL") }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error starting session: \(error)")
                return
            }
            guard let data = data else { fatalError("Could not get data") }
            
            do {
                let decodedData = try JSONDecoder().decode([RecommendedItemModel].self, from: data)
                for i in 0..<decodedData.count {
                    DispatchQueue.main.async {
                        self?.recommendedItems.append(RecommendedItemModel(
                            id: decodedData[i].id,
                            //download_url: decodedData[i].download_url,
                            author: decodedData[i].author)
                        )
                        
                    }
                }
            } catch {
                print("\n\nError decoding data: \(error)\n\n")
            }
            
            
        }
        .resume()
    }
    
    
}
