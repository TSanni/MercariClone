//
//  SellView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/25/23.
//

import SwiftUI

struct SellView: View {
    @EnvironmentObject var vm: AppStateManager
    @State private var showFullCover = false
    
    var body: some View {

        ScrollView(showsIndicators: true) {
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    ZStack(alignment: .bottomTrailing) {
                        VStack(alignment: .leading) {
                            Text("Making money is")
                            
                            HStack {
                                Text("easier than")
                                Text("ever").foregroundColor(.mercariPurple)
                            }
                            
                        }
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        
                        CurveLine()
                            .frame(width: 150, height: 50)
                            .offset(x: 20, y: 35)
                    }
                    
                    
                    Button {
                        
                    } label: {
                        Text("Start listing now")
                            .fontWeight(.medium)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(Color.mercariPurple)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                    
                    SaleType(name: "Sold in the last 10 minutes", itemTag: "SOLD")
                }
                .padding()

                

                CapsuleGridView()

                
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "target")
                        .foregroundColor(.primary)
                }

            }
        }
    }
}

struct SellView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SellView()
                .environmentObject(RecommendedViewMdel())
        }
    }
}
