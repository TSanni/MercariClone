//
//  ShopLocalView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/23/23.
//

import SwiftUI

struct ShopLocalView: View {
    @EnvironmentObject var vm: RecommendedViewMdel
    let rows = [GridItem(.fixed(120))]
    @State private var showDeliveryAddressScreen = false


    var body: some View {
        VStack {
            
            //Button for showing DeliveryAddressView
            Button {
                showDeliveryAddressScreen.toggle()
            } label: {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Deliver to ")
                    + Text("Sugar Land 77479")
                        .fontWeight(.semibold)
                    
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 10)
                    
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .tint(.black)
            
            ScrollView(.vertical) {
                
                Group {
                    LocalDealType(name: "Limited-time deals", itemTag: "10% OFF")
                    LocalDealType(name: "Only for local shoppers", itemTag: "LOCAL")
                    LocalDealType(name: "Home Decor", itemTag: "LOCAL")
                    LocalDealType(name: "Electronics", itemTag: "LOCAL")
                    LocalDealType(name: "Last-minute gifts", itemTag: "LOCAL")
                    LocalDealType(name: "Sports and outdoors", itemTag: "LOCAL")
                }
                .padding(.horizontal)
                


            }
            .refreshable {
                
            }

        }
        .sheet(isPresented: $showDeliveryAddressScreen) {
            DeliveryAddressView()
                .presentationDetents([.fraction(0.35)])
        }

    }
}

struct ShopLocalView_Previews: PreviewProvider {
    static var previews: some View {
        ShopLocalView()
            .environmentObject(RecommendedViewMdel())
        
        ShopLocalView()
            .previewDevice("iPhone SE (3rd generation)")
            .environmentObject(RecommendedViewMdel())
        
        ShopLocalView()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .environmentObject(RecommendedViewMdel())
        
        ShopLocalView()
            .previewDevice("iPhone 11 Pro Max")
            .environmentObject(RecommendedViewMdel())

    }
}

struct LocalDealType: View {
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
