//
//  LikesView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 5/2/23.
//

import SwiftUI

struct LikeOrSearchView: View {
    @Binding var showSearchScreen: Bool
    let image: String
    let imageDescription: String
    let details: String
    let prompt: String
    @FocusState var searchInFocus: Bool


    
    var body: some View {
        VStack(spacing: 15.0) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text(imageDescription)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(details)
                .multilineTextAlignment(.center)
                .frame(width: 300.0)
            
            
            Button {
                showSearchScreen = true
                searchInFocus = true
            } label: {
                Text(prompt)
                    .fontWeight(.semibold)
            }
            .tint(.mercariPurple)
            .padding()

            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikeOrSearchView(showSearchScreen: .constant(false), image: "shippingbox.fill", imageDescription: "No liked items", details: "Like an item and we'll let you know when the price drops", prompt: "Find something you like")
    }
}
