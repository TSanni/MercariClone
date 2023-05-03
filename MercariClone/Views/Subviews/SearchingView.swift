//
//  SearchingView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/20/23.
//

import SwiftUI

struct SearchingView: View {
    @Binding var searchText: String
    @FocusState var focus: Bool
    //Will add persistence (Core Data or Realm?) to get recent searches
    //Will add another conditional view to determine whether to show empty
    //screen or recent searches screen
    
    
    var body: some View {
        
        ZStack {
            
            Color.white.opacity(0.000001)
            
            if searchText.isEmpty {
                VStack(spacing: 20) {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("Nothing here ... yet")
                        .fontWeight(.bold)
                    
                    Text("Find your next favorite thing")
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            }
            else {
                VStack {
                    Text("Suggested searches screen")
                        .fontWeight(.bold)
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

        }
        .onTapGesture {
            withAnimation {
                focus = false
            }
        }
        
    }
}

struct SearchingView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingView(searchText: .constant(""))
    }
}
