//
//  SearchBar.swift
//  MercariClone
//
//  Created by Tomas Sanni on 4/30/23.
//

import SwiftUI

struct SearchBar: View {
    let usingCart: Bool
    @Binding var showSearchScreen: Bool
    @State private var addChevron: Bool = false
    @Binding var searchtext: String
    @FocusState var focus: Bool
    
    var body: some View {
        
        
        VStack {
            HStack {
                
                if addChevron {
                    chevronView
                }
                
                searchView
                
                if usingCart {
                    if !addChevron {
                        cart
                    }
                }
            }
            .onChange(of: showSearchScreen, perform: { newValue in
                addChevron = newValue
            })
            .animation(.easeInOut(duration: 0.3), value: addChevron)
            .padding(.horizontal)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack { // Need to embed SearchBar in another view for transition to work. Don't know why.
            SearchBar(usingCart: false, showSearchScreen: .constant(false), searchtext: .constant(""))
                .preferredColorScheme(.light)
            
            Spacer()
        }
        
    }
}




extension SearchBar {
    private var chevronView: some View {
        Button {
            addChevron = false
            focus = false
            showSearchScreen = false
        } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
        }
        .buttonStyle(CustomButton())
        .transition(AnyTransition.opacity)
    }
    
    private var searchView: some View {
        HStack {
            if !addChevron {
                Image(systemName: "magnifyingglass")
                    .transition( AnyTransition.move(edge: .trailing).combined(with: .opacity) )
                
            }
            
            TextField("Search for anything", text: $searchtext)
                .foregroundColor(.black)
                .tint(Color.mercariPurple)
                .focused($focus)
                .onTapGesture {
                    addChevron = true
                    focus = true
                    showSearchScreen = true
                }
            
            if !searchtext.isEmpty {
                Button {
                    searchtext = ""
                } label: {
                    Image(systemName: "xmark.circle")
                }
                .tint(.black)
                
            }
            
        }
        .frame(height: 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background {
            Capsule()
                .fill(Color.mercariGray)
        }
    }
    
    private var cart: some View {
        NavigationLink {
            CartView()
        } label: {
            Image(systemName: "cart")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
        }
    }
}
