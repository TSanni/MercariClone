//
//  HowMercariWorksCardsModel.swift
//  MercariClone
//
//  Created by Tomas Sanni on 4/26/23.
//

import Foundation

struct HowMercariWorksCardsModel: Identifiable {
    let id = UUID()
    let image: String
    let cardTitle: String
    let cardDetails: String
    let readTime: String
    
    
    
    static let HowMercariWordsCardsStatic: [HowMercariWorksCardsModel] = [
        HowMercariWorksCardsModel(
            image: "cart",
            cardTitle: "Shipping made easy",
            cardDetails: "QR code. Mercari Local. UPS Pack & Ship. We've made shipping easier for you",
            readTime: "5 min read"),
        
        HowMercariWorksCardsModel(
            image: "bag",
            cardTitle: "How to package items",
            cardDetails: "A step by step guide to pack your items well",
            readTime: "4 min read"),
        
        HowMercariWorksCardsModel(
            image: "iphone.gen2",
            cardTitle: "Free listing. Simple fees.",
            cardDetails: "Listings are free. We only charge you once the transation is complete.",
            readTime: "3 min read"),
        
        HowMercariWorksCardsModel(
            image: "dollarsign.circle",
            cardTitle: "Getting paid is easy",
            cardDetails: "Once the transaction is complete, you get paid. It's that simple",
            readTime: "2 min read"),
        
        HowMercariWorksCardsModel(
            image: "lock.fill",
            cardTitle: "We protect our sellers",
            cardDetails: "See how our seller protection works.",
            readTime: "5 min read")
    ]
}
