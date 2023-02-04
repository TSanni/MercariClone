//
//  SaleType.swift
//  MercariClone
//
//  Created by Tomas Sanni on 2/2/23.
//

import SwiftUI

struct SaleType: View {
    @EnvironmentObject var vm: RecommendedViewMdel
    let rows = [GridItem(.fixed(120))]
    let name: String
    let itemTag: String //change this to use data from viewModel
    
    var body: some View {
        HStack {
            Text(name)
                .fontWeight(.semibold)
            Spacer()
            Button {
                
            } label: {
                Text("See all")
                    .foregroundColor(Color.mercariPurple)
            }
            
        }
        .padding(.vertical)
        
        
        //Scroll for limited time deals row
        ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach(vm.recommendedItems) { num in
                        GeometryReader { geo in
                            ZStack(alignment: .topLeading) {
                                VStack(alignment: .leading) {
                                    //AsyncImage(url: URL(string: num.download_url))
                                    
                                    AsyncImage(url: URL(string: num.download_url)) { image in
                                        image.resizable().scaledToFit()
                                            .frame(width: 120, height: 120)

                                    } placeholder: {
                                        //ProgressView()
                                        Image(systemName: "photo")
                                            .resizable().scaledToFit()
                                            .frame(width: 120, height: 120)
                                    }
                                                                    
                                    //Text(num.id)
                                    Text("$\(Int.random(in: 2...100))")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                }
                                
                                RoundedRectangle(cornerRadius: 3)
                                    .fill(Color.mercariPurple)
                                    .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.15)
//                                            .frame(width: 60, height: 25)
                                    .overlay {
                                        Text(itemTag)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                            .minimumScaleFactor(0.5)
                                            .padding(3)
                                    }
                            }
                        }
                        .frame(width: 120, height: 150)

                    }
                }
            
        }
    }
}

struct SaleType_Previews: PreviewProvider {
    static var previews: some View {
        SaleType(name: "Home Decor", itemTag: "tag")
            .environmentObject(RecommendedViewMdel())
    }
}
