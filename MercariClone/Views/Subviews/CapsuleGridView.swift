//
//  CapsuleGridView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 2/2/23.
//

import SwiftUI

struct CapsuleGridView: View {
    let rows = [
        GridItem(.fixed(55)),
        GridItem(.fixed(55)),
        GridItem(.fixed(55))
    ]
    
    
    let randomText = [
        "Top 30 selling brands",
        "Musical instruments",
        "From your drawer",
        "Sold in the last 10 minutes",
        "Demand surge",
        "Kids",
        "Sneakers",
        "Mercari Local",
        "Independent",
        "Gaming",
        "Fandom"
    ]

    var body: some View {
        VStack {
            HStack {
                Text("Listing ideas")
                    .fontWeight(.bold)
                    .font(.title2)
                Spacer()
                Button {
                    
                } label: {
                    Text("See all")
                        .foregroundColor(.mercariPurple)
                        .fontWeight(.semibold)
                }

            }
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                
                VStack(alignment: .leading) {
                    HStack {
                        ForEach(0..<7) { _ in
                            HStack {
                                Image(systemName: "cloud")
                                Text(randomText.randomElement()!)
                            }
                            .padding()
                            .background(Color.mercariGray)
                            .clipShape(Capsule())
                        }
                    }
                    
                    HStack {
                        ForEach(0..<7) { _ in
                            HStack {
                                Image(systemName: "cloud")
                                Text(randomText.randomElement()!)
                            }
                            .padding()
                            .background(Color.mercariGray)
                            .clipShape(Capsule())
                        }
                    }
                }
                .padding(.leading)
                
                
//                LazyHGrid(rows: rows) {
//                    ForEach(0..<21) { _ in
//
//
//                        HStack {
//                            Image(systemName: "cloud")
//                            Text(randomText.randomElement()!)
//                        }
//                        .padding()
//                        .background(Color.mercariGray)
//                        .clipShape(Capsule())
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                    }
//                }
            }
        }
    }
}

struct CapsuleGridView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleGridView()
    }
}
