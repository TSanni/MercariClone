//
//  HowMercariWorksCards.swift
//  MercariClone
//
//  Created by Tomas Sanni on 4/25/23.
//

import SwiftUI

struct HowMercariWorksCards: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(HowMercariWorksCardsModel.HowMercariWordsCardsStatic) { card in
                    ZStack {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.white)
                        
                        VStack(spacing: 20) {
                            Image(systemName: card.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            
                            Text(card.cardTitle)
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Text(card.cardDetails)
                                .multilineTextAlignment(.center)
                                .frame(maxHeight: .infinity)
                            
                            Text(card.readTime)
                                .frame(maxWidth: .infinity)
                                .padding(10)
                                .background(Color.mercariGray)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        }
                        .padding()
                    }
                    .aspectRatio(2.5/3, contentMode: .fit)
                    .frame(width: 270)
                    .padding(5)
                    
                }
            }
        }
        .shadow(radius: 5)
        .padding(.leading)

    }
}

struct HowMercariWorksCards_Previews: PreviewProvider {
    static var previews: some View {
        HowMercariWorksCards()
        HowMercariWorksCards()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
