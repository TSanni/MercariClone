//
//  SellerBadgeItems.swift
//  MercariClone
//
//  Created by Tomas Sanni on 4/23/23.
//

import SwiftUI

//MARK: - Profile Screen Seller Badge Items SubView
struct SellerBadgeItems: View {
    let image: String
    let nameFirst: String
    let nameSecond: String
    var body: some View {

        VStack {
            ZStack {
                
                Circle()
                    .stroke(lineWidth: 1)
                    .fill(Color.gray)
                    .frame(width: 50, height: 50)
                
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            
            Text(nameFirst)
            Text(nameSecond)
        }
        .foregroundColor(.black.opacity(0.4))
    }
}

struct SellerBadgeItems_Previews: PreviewProvider {
    static var previews: some View {
        SellerBadgeItems(image: "house", nameFirst: "White", nameSecond: "House")
    }
}
