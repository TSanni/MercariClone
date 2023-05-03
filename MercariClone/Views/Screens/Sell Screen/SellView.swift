//
//  SellView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/25/23.
//

import SwiftUI


//MARK: - SellView
struct SellView: View {
    @EnvironmentObject var vm: AppStateManager
    
    var body: some View {
        
        ScrollView(showsIndicators: true) {
            
            VStack(alignment: .leading) {
                
                sellViewHeading
                
                listingButton
                
                SaleType(name: "Sold in the last 10 minutes", itemTag: "SOLD")
            }
            .padding()
            
            CapsuleGridView()
            
            VStack(alignment: .leading) {
                Text("How Mercari works")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                
                HowMercariWorksCards()
            }
            
            EarningMoneyIsEasyView()
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





//MARK: - SellView Previews
struct SellView_Previews: PreviewProvider {
    static var previews: some View {
        //        NavigationView {
        SellView()
            .environmentObject(RecommendedViewMdel())
        //        }
    }
}


//MARK: - SellView Extension
extension SellView {
    private var sellViewHeading: some View {
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
    }
    
    
    private var listingButton: some View {
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
    }
}

