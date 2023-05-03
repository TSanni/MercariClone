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
                .padding(.top)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .tint(.black)
            
            ScrollView(.vertical) {
                
                Group {
                    SaleType(name: "Limited-time deals", itemTag: "10% OFF")
                    SaleType(name: "Only for local shoppers", itemTag: "LOCAL")
                    SaleType(name: "Home Decor", itemTag: "LOCAL")
                    SaleType(name: "Electronics", itemTag: "LOCAL")
                    SaleType(name: "Last-minute gifts", itemTag: "LOCAL")
                    SaleType(name: "Sports and outdoors", itemTag: "LOCAL")
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


