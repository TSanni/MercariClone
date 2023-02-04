//
//  ForYouView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/23/23.
//

import SwiftUI

struct ForYouView: View {
    let columns = [GridItem(.adaptive(minimum: 120))]
    @EnvironmentObject var vm: RecommendedViewMdel

    var body: some View {
        ScrollView {
            Text("Recommended for you")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            
            LazyVGrid(columns: columns) {
                ForEach(vm.recommendedItems) { num in
                    VStack(alignment: .leading) {
                        
                        AsyncImage(url: URL(string: num.download_url)) { image in
                            image.resizable().scaledToFit().frame(width: 125, height: 125)
                        } placeholder: {
                            //ProgressView()
                            Image(systemName: "photo").resizable().scaledToFit().frame(width: 120, height: 120)
                        }
                        //Text(num.id)
                        Text("$\(Int.random(in: 2...100))")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                    }
                    .shadow(radius: 1)
                    .padding(.bottom)

                }
            }
            .padding(.horizontal)
            
            
            Divider()
            
            VStack(spacing: 10) {
                Image(systemName: "shield.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.purple)
                Text("Buyer Protection")
                    .font(.headline)
                    .foregroundColor(Color.purple)
                Text("Receive your item as described or your money back for eligible orders")
                    .font(.subheadline)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .frame(maxWidth: .infinity)
            
            
            Divider()
            
        }
        .refreshable {
            
        }
        

    }
}

struct ForYouView_Previews: PreviewProvider {
    static var previews: some View {
        ForYouView()
            .environmentObject(RecommendedViewMdel())

    }
}
