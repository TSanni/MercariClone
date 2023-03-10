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
                    
                    VStack(alignment: .leading) {
                        Text("Making money is")
                        
                        HStack {
                            Text("easier than")
                            Text("ever").foregroundColor(.mercariPurple)
                        }
                         
                    }
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    
                    
                    Button {
                        
                    } label: {
                        Text("Start listing now")
                            .padding()
                            .background(Color.mercariPurple)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
//                    .padding(.bottom, 30)
                    
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
        
        
//        Text("Items to sell go here")
//            .fullScreenCover(isPresented: $showFullCover) {
//                OnboardingView()
//            }
//            .onAppear {
//                if vm.signedIn {
//                    showFullCover = false
//                } else {
//                    showFullCover = true
//                }
//            }
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
