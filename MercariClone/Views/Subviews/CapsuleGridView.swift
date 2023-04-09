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
    
    let randomImages = [
        "cloud",
        "headphones",
        "tshirt.fill",
        "shoeprints.fill",
        "camera.fill",
        "music.mic",
        "eyeglasses"
    ]

    var body: some View {
        VStack {
            HStack {
                Text("Listing ideas")
                    .fontWeight(.medium)
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
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                VStack(alignment: .leading) {
                    HStack {
                        ForEach(0..<7) { _ in
                            
                            Button {
                                
                            } label: {
                                HStack {
                                    Image(systemName: randomImages.randomElement()!)
                                    Text(randomText.randomElement()!)
                                }
                                .padding()
                                .background(Color.mercariGray)
                                .clipShape(Capsule())
                            }
                        }
                    }
                    
                    HStack {
                        ForEach(0..<7) { _ in
                            
                            Button {
                                
                            } label: {
                                HStack {
                                    Image(systemName: randomImages.randomElement()!)
                                    Text(randomText.randomElement()!)
                                }
                                .padding()
                                .background(Color.mercariGray)
                                .clipShape(Capsule())
                            }
                        }
                    }
                    
                    HStack {
                        ForEach(0..<7) { _ in
                            
                            Button {
                                
                            } label: {
                                HStack {
                                    Image(systemName: randomImages.randomElement()!)
                                    Text(randomText.randomElement()!)
                                }
                                .padding()
                                .background(Color.mercariGray)
                                .clipShape(Capsule())
                            }
                        }
                    }
                }
                .foregroundColor(.black)
                .padding(.leading)
                
                
            }
        }
    }
}

struct CapsuleGridView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleGridView()
    }
}
